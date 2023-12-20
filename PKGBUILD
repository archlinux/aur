# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-fontmath-git
pkgver=0.9.3.r4.g8325a8f
pkgrel=1
pkgdesc='A collection of objects that implement fast font, glyph, etc. math.'
url='https://github.com/robotools/fontMath'
license=('MIT')
arch=(any)
depends=(python-fonttools)
checkdepends=(python-pytest)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              git)
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

check() {
    cd "$pkgname"
    PYTHONPATH=Lib pytest Lib/fontMath/test
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

