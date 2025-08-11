# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=colbert-ai
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.22
pkgrel=1
pkgdesc="Efficient and Effective Passage Search via Contextualized Late Interaction over BERT"
arch=("any")
url="https://github.com/stanford-futuredata/ColBERT"
license=('MIT')
depends=(python-bitarray python-datasets python-dotenv python-flask python-gitpython python-ninja python-scipy python-tqdm python-transformers python-ujson)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=("python-faiss" "python-pytorch")
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('00afcfef5d715f0d3a706be90d2b5b74a2bb7c402073807ceb5515c0026a8886')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
