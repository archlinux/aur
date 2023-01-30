# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-fontpens-git
pkgver=0.2.4.r12.g776df99
pkgrel=1
pkgdesc='A collection of classes implementing the pen protocol for manipulating glyphs.'
url='https://github.com/robotools/fontpens'
license=('BSD')
arch=(any)
depends=(python
         python-fonttools)
checkdepends=(python-fontparts
              python-pytest)
makedepends=(python-setuptools-scm
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
    PYTHONPATH=Lib pytest Lib
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

