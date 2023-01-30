# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-openstep-plist-git
pkgver=0.3.0.post1.r0.gfe887b0
pkgrel=1
pkgdesc='OpenStep plist parser and writer written in Cython'
url='https://github.com/fonttools/openstep-plist'
license=('MIT')
arch=(any)
depends=(python)
checkdepends=(python-pytest)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              cython
              git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname"
    python setup.py test
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

