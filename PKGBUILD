pkgname=hawkbit-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform CLI client for Eclipse hawkBit Management API"
arch=("any")
url="https://github.com/pffmachado/hawkbit-cli"
license=("MIT")
depends=("python" "python-httpx" "python-rich" "python-typer")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pffmachado/hawkbit-cli/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("SKIP")

build() {
  cd "${srcdir}/hawkbit-cli-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/hawkbit-cli-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
