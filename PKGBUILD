# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=zuban
pkgver=0.5.1
pkgrel=1
pkgdesc="A Mypy-compatible Python Language Server built in Rust"
arch=('x86_64')
url="https://zubanls.com"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('python-build' 'python-installer' 'python-maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zubanls/zuban/archive/v${pkgver}.tar.gz")
sha256sums=('87fae0bf49f233375fe0be19a85677e7f770da122369d6d7a13f1d3a4a6e3285')

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
