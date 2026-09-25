# Maintainer: Stefanie Jane <stef@hyperbliss.tech>

pkgname=sibyl
pkgver=1.4.1
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
    "sibyl-dev-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/f5/9d916152fbce568d13acb5489f70825a0e824c1ded835125215ed1a9f204/sibyl_dev-1.4.1.tar.gz"
    "sibyl-core-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fa/27/a6c8c2b7bb911101aeff2d427f8f40511e56041401dfdfc8272acfd3a437/sibyl_core-1.4.1.tar.gz"
)
sha256sums=(
    'f562e90e7cf00653183e59737921e8a9c24a9354caad407e58bc0fc9638c7799'
    '45683a372933572692b121ca727d7328746de3f6c8c4a54566c78175b7c3c087'
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
