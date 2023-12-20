# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-mutatormath-git
pkgver=3.0.1.r3.gb0a87ec
pkgrel=2
pkgdesc='Python library for piecewise linear interpolation in multiple dimensions with multiple, arbitrarily placed, masters.'
url='https://github.com/LettError/MutatorMath'
license=('BSD')
arch=(any)
depends=(python
         python-defcon
         python-fontmath
         python-fonttools)
makedepends=(git
            python-{build,installer}
            python-setuptools
            python-wheel)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    python -m build -wn
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}
