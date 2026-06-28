# Maintainer: Stefanie Jane <stef@hyperbliss.tech>

pkgname=sibyl
pkgver=1.0.2
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
    "sibyl-dev-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/12/04/8ae5c9cba74f80b9ed4726d94bdbf5d1330b184a971d2ac97068022af554/sibyl_dev-1.0.2.tar.gz"
    "sibyl-core-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/52/22/e49907d73758aa97ec869b1ec7acf5727dcbf628d51088cb2cd28f7348e2/sibyl_core-1.0.2.tar.gz"
)
sha256sums=(
    'a7b02da858dc0a7a5c1dce847f93a400cf03e9fdeae4df4276ab198ae9f2190d'
    '90c8c4244bb3b32754f843590d49cb9dcf5833bb038be8098ee7a038c0008962'
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
