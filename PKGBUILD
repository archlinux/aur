# Maintainer: Stefanie Jane <stef@hyperbliss.tech>

pkgname=sibyl
pkgver=1.5.1
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
    "sibyl-dev-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/03/46/b143915e073b279c8e0875a7d58a7106e213f527d28e7a406bb4e339a7ff/sibyl_dev-1.5.1.tar.gz"
    "sibyl-core-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/85/c2/01e1c10d91f2a5288d9433e14257f0d47a88704ee3bf963d8f629167b96e/sibyl_core-1.5.1.tar.gz"
)
sha256sums=(
    '80f22919ea7232373164841a22636492661b8a46796572757d3d9b98de1cbdf6'
    'de790b7f322dd39ed5cc268ced1c0fd016a567d2b37dbbba5a4542e2d46bb54a'
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
