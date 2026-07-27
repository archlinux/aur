# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.11.1
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
sha256sums=('185eab92470dbf1b47561fc84a94f0bb85f4d326350f0bbdb1c8402400042cf0')

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
