# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.7.1
pkgrel=2
pkgdesc='Python SDK for ACP clients and agents'
arch=('x86_64')
url='https://github.com/agentclientprotocol/python-sdk'
license=(Apache-2.0)
depends=(
    "python"
    "python-pydantic"
)
makedepends=(
    "python-pdm-backend"
    "python-pytest"
    "python-pytest-asyncio"
    "ruff"
    "python-dotenv"
    "prek"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('a30d9aa25185a4a8a1a8216b797912106c04d385efb815e5cabe865d8699e439')

build() {
    cd "python-sdk"
    python -m build --wheel --no-isolation
}

check() {
    cd "python-sdk"
    #export UV_PYTHON_PREFERENCE=only-system
    uv sync
    uv run prek install
    uv run python -m pytest --doctest-modules
}

package() {
    cd "python-sdk"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
