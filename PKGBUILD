# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=zuban
pkgver=0.4.2
pkgrel=1
pkgdesc="A Mypy-compatible Python Language Server built in Rust"
arch=('x86_64')
url="https://zubanls.com"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('python-build' 'python-installer' 'python-maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zubanls/zuban/archive/v${pkgver}.tar.gz")
sha256sums=('5dcbc18cc4c211a035987a5668cf176232392e83df610210e576dcd38e65ed04')

build() {
    cd "${pkgname}-${pkgver}/deploy/pypi/zuban"
    CFLAGS+=" -ffat-lto-objects"
    ./pre-maturin-build.sh
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}/deploy/pypi/zuban"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
