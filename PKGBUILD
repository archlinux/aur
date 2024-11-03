# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=extract-msg
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.52.0
pkgrel=1
pkgdesc="Extracts emails and attachments saved in Microsoft Outlook's .msg files"
arch=("any")
url="https://github.com/TeamMsgExtractor/msg-extractor"
license=('MIT')
depends=("python-olefile" "python-tzlocal" "python-compressed-rtf" "python-ebcdic" "python-beautifulsoup4" "python-rtfde" "python-red-black-tree-mod")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('c21c548c43e1f0cdce5616102d33e590e2b46fbdc9d04f21af4eb62dcbf296dd')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
