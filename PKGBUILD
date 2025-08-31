# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langchain-cli
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.0.37
pkgrel=1
pkgdesc="A CLI for interacting with LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/cli"
license=('MIT')
depends=(python-typer python-gitpython python-langserve uvicorn python-tomlkit python-gritql)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('1d2884b413c06710ac2cbf6a170d350db8ef23e30f235cd4139c3f1e66219e60c448c8ca875566113669ea93722082888afbe859127a2beb158a1ef4cd13149c')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
