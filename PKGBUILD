# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
pkgver=0.1.19
pkgrel=2
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url="https://pypi.org/project/langsmith"
license=('MIT')
_module=${pkgname#python-}
_src_folder="${_module/-/_}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module/-/_}-${pkgver}.tar.gz")
sha256sums=('461093c19d5eb9b108069381c7342ba2fa30d60d77e5361e2374b779fa401b8b')
depends=(python python-pydantic python-requests python-openai python-orjson
    python-pandas python-psutil python-typing_extensions python-urllib3)
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
