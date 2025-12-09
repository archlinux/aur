# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.7.0
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
    "python-pytest"
    "python-pytest-asyncio"
    "ruff"
    "python-dotenv"
    "prek"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

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
