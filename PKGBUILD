# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-core
_module='langchain-core'
_src_folder='langchain_core-0.1.18'
pkgver=0.1.18
pkgrel=2
pkgdesc="Building applications with LLMs through composability"
url="https://github.com/langchain-ai/langchain"
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
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module/-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/bb7325114629604b00167f00d49e704a7d477d8d/LICENSE")
sha256sums=('ad470b21cdfdc75e829cd91c8d8eb7e0438ab8ddb5b50828125ff7ada121ee7b'
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
