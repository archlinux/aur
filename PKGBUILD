# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-core
pkgver=0.1.29
pkgrel=2
pkgdesc="Building applications with LLMs through composability"
url="https://pypi.org/project/langchain-core"
depends=(python
    python-anyio
    python-jsonpatch
    python-langsmith
    python-packaging
    python-pydantic
    python-yaml
    python-requests
    python-tenacity
    python-jinja
    python-typing_extensions)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
_module=${pkgname#python-}
_src_folder="${_module/-/_}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module/-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/v0.1.11/LICENSE")
sha256sums=('6731dabffad03b9213ada2640d54ed7f4ef6b99fce87ade3c71474ae154dd3cc'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
