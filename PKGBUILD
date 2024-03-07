# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-text-splitters
_pkgname=${pkgname#python-}
pkgver=0.0.1
pkgrel=4
pkgdesc="Building applications with LLMs through composability"
url="https://pypi.org/project/langchain-text-splitters"
depends=(python
    python-tiktoken
    python-requests
    python-lxml
    python-langchain-core)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
_src_name="${_pkgname//-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_src_name}.tar.gz"
        "https://github.com/langchain-ai/langchain/raw/v0.1.11/LICENSE")
sha256sums=('ac459fa98799f5117ad5425a9330b21961321e30bc19a2a2f9f761ddadd62aa1'
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
