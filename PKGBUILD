# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.12.1
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
    "python-build"
    "python-installer"
    "python-pdm-backend"
)
checkdepends=(
    "python-dotenv"
    "python-pytest"
    "python-pytest-asyncio"
    "uv"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('9d8a08fcff3f53f40da34d0dbfa6c60ab16eed894f7d6c7042a2c6e16dd8389f')

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
