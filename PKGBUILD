# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.11
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-pydantic python-requests python-requests-toolbelt)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langsmith-pyo3 python-vcrpy python-zstandard)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('edf070349dbfc63dc4fc30e22533a11d77768e99ef269399b221c48fee25c737')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
