# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.10.1
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
sha256sums=('a02a979f1f01eb03b046fabe7daedcf8b413a620ec5e7870fe8f3fec872abe2e')

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
