# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=python-rm2pdf
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=2
pkgdesc="A rendering library for *.rm files to pdf files."
arch=("any")
url="https://github.com/stwa/rm2pdf"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
depends=('python-rmscene')
source=(
    "https://github.com/stwa/rm2pdf/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
    'df11a1ebbc04bbe90efa4b82acb4a0a70da66c09371c30c9b821803e05429422'
)

build() {
    mv ../.git{,.bak}
    (
        cd "$srcdir/$_name-$pkgver"

        python -m build --wheel --no-isolation
    )
    mv ../.git{.bak,}
}

package() {
    cd "$srcdir/$_name-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
