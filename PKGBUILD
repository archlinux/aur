# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
pkgver=0.1.5
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url='https://github.com/langchain-ai/langsmith-sdk'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5adf158b944ff93fcac0485c246ff87f2be6928212e2e900b226d9fcbc8ab8ed')
depends=(python python-pydantic python-requests python-openai python-pandas
    python-psutil python-typing_extensions python-urllib3)
makedepends=(python-build python-installer python-wheel python-poetry-core)

build() {
    cd "${srcdir}/langsmith-sdk-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/langsmith-sdk-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    cd "${srcdir}/langsmith-sdk-${pkgver}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
