# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=zuban
pkgver=0.7.0
pkgrel=1
pkgdesc="A Mypy-compatible Python Language Server built in Rust"
arch=('x86_64')
url="https://zubanls.com"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('python-build' 'python-installer' 'python-maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zubanls/zuban/archive/v${pkgver}.tar.gz")
sha256sums=('099f618f773251405ab87f2b4cc1b618878336b616d4730fca5f53df566db6d4')

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
