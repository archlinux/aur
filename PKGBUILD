# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-xmldiff-git
pkgver=2.6.3.r9.g7434865
pkgrel=3
pkgdesc='A library and command line utility for diffing xml'
url='https://github.com/Shoobx/xmldiff'
license=('MIT')
arch=(any)
depends=(python
         python-lxml
         python-six)
makedepends=(git
             python-setuptools)
provides=("${pkgname%-git}" xmldiff)
conflicts=("${pkgname%-git}" xmldiff)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

check() {
    cd "$pkgname"
    python setup.py test
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

