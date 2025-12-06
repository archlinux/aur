# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.4.56
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-packaging python-pydantic python-requests python-requests-toolbelt python-zstandard python-uuid-utils)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel' 'python-hatchling')
optdepends=(python-langsmith-pyo3 python-openai-agents python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-http python-opentelemetry-sdk python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('c15f06b8b965b78830c9a76e18b7436e167f628429f2b618c2c3d9fbb113092ad21ae1ae9f232b87774c5ba23f7e16486cc7e3e8dab0f87e8d43e75f04643cdd')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
