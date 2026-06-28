# Maintainer: taotieren <cadmin@taotieren.com>

pkgname=monobit-git
pkgver=0.52.0.r0.ged76b370
pkgrel=1
pkgdesc='Tools for working with monochrome bitmap fonts'
url='https://github.com/robhagemans/monobit'
license=('MIT')
arch=(any)
_pydeps=(
    reportlab
    pillow
    bidi
    arabic-reshaper
    hatchling
    uniseg
    fonttools
    libarchive-c
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    python-{build,installer}
    python-setuptools-scm
    python-wheel
)
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

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

