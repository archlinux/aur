# Maintainer: Stefanie Jane <stef@hyperbliss.tech>

pkgname=sibyl
pkgver=1.1.0
pkgrel=1
pkgdesc="Persistent memory and task coordination CLI for AI coding agents"
arch=('any')
url="https://github.com/hyperb1iss/sibyl"
license=('Apache-2.0')
provides=('sibyl-cli')
conflicts=('sibyl-cli')
depends=(
    'docker'
    'docker-compose'
    'python>=3.13'
    'python-anyio'
    'python-dotenv'
    'python-httpx'
    'python-passlib'
    'python-pydantic'
    'python-pydantic-settings'
    'python-pyjwt'
    'python-yaml'
    'python-rich'
    'python-structlog'
    'python-tomli-w'
    'python-typer'
    'python-websockets'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-wheel'
)
source=(
    "sibyl-dev-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d4/25/6edffa0fc9d53a2dd20f7cd053024f6567a29592179ac82c69567638ab74/sibyl_dev-1.1.0.tar.gz"
    "sibyl-core-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/78/96/090212251c8b7bee538a2e56ffce8ec7dd556da3d47579cb40589f124aaf/sibyl_core-1.1.0.tar.gz"
)
sha256sums=(
    'ff19fa9a5157e38f0ced485b14809123a09ffaf70661d74abbcd8472a3f124a6'
    'ccb1b991f2bc9af2dff4b0dd1c416bc35a1f24cd220a60a2e2068673464a1a9e'
)

build() {
    python -m build --wheel --no-isolation "sibyl_core-${pkgver}"
    python -m build --wheel --no-isolation "sibyl_dev-${pkgver}"
}

package() {
    python -m installer --destdir="${pkgdir}" "sibyl_core-${pkgver}"/dist/*.whl
    python -m installer --destdir="${pkgdir}" "sibyl_dev-${pkgver}"/dist/*.whl
    install -Dm644 "sibyl_dev-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
