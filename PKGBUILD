# Maintainer: Stefanie Jane <stef@hyperbliss.tech>

pkgname=sibyl
pkgver=1.4.5
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
    "sibyl-dev-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/29/29/5a2e81fb37b05da5457cb5ead22ff9cb74bcf4ce3cf55687e3258839ed40/sibyl_dev-1.4.5.tar.gz"
    "sibyl-core-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/17/e3/1f45602b1e7b61d0cfbe0544604079b9cfd223550299af07bdd469842e59/sibyl_core-1.4.5.tar.gz"
)
sha256sums=(
    '4706e90eb005d024853e0e050c8bf83b359d532bea95dd10a0ef2a720c19e3b9'
    '226693addad913922a95eb689b3d53257ed593b66cbfe8ef88b711b81db52ac6'
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
