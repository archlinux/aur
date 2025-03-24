# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=extract-msg
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.54.0
pkgrel=1
pkgdesc="Extracts emails and attachments saved in Microsoft Outlook's .msg files"
arch=("any")
url="https://github.com/TeamMsgExtractor/msg-extractor"
license=('MIT')
depends=(python-beautifulsoup4 python-compressed-rtf python-ebcdic python-olefile python-red-black-tree-mod python-rtfde python-tzlocal)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b8ed8198e64ccb34ae66fc1c2c422e56f9234c64bbf80afcda7100593920ff2b')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
