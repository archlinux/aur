# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.8.1
pkgrel=1
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
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('649196e26454e0aa981c91489fb69d4687f79c8d591959b0c9b14ad99f251773')

build() {
    cd "python-sdk"
    python -m build --wheel --no-isolation
}

check() {
    cd "python-sdk"
    #export UV_PYTHON_PREFERENCE=only-system
    uv sync
    uv run python -m pytest --doctest-modules
}

package() {
    cd "python-sdk"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
