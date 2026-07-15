# Maintainer: Bruno Laranjo <laranjos16@gmail.com>
pkgname=loki-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A logcli-style CLI for querying Grafana Loki instances"
arch=("any")
url="https://github.com/bruno-laranjo/loki-cli"
license=("MIT")
depends=(
    "python"
    "python-click"
    "python-httpx"
    "python-yaml"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bruno-laranjo/loki-cli/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("SKIP")

build() {
    cd "${srcdir}/loki-cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/loki-cli-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
