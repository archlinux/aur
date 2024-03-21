# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-core
_pkgname=${pkgname#python-}
pkgver=0.1.33
pkgrel=1
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
_src_name="${_pkgname/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_src_name}.tar.gz"
        "https://github.com/langchain-ai/langchain/raw/v0.1.13/LICENSE")
sha256sums=('545eff3de83cc58231bd2b0c6d672323fc2077b94d326ba1a3219118af1d1a66'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')

build() {
    cd "${_src_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
