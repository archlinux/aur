# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
_pkgname=${pkgname#python-}
pkgver=0.1.29
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url="https://github.com/langchain-ai/langsmith-sdk"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fcf7cb72d5950d82dcbfc5517d1916e2326d52443ac1898135e8c68a04af3bb7')
depends=(python python-pydantic python-requests python-openai python-orjson
    python-pandas python-psutil python-typing_extensions python-urllib3)
makedepends=(python-build python-installer python-wheel python-poetry-core)

build() {
    cd "${_pkgname}-sdk-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-sdk-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_pkgname}-sdk-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
