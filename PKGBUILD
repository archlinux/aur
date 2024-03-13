# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
_pkgname=${pkgname#python-}
pkgver=0.1.24
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url="https://github.com/langchain-ai/langsmith-sdk"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c08c5d60f4e897e44a2b3b1f676f9f16a3a7b80333854e751256122d4b3f4247')
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
