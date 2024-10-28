# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=pkolaczk
_basename=fclones-gui
pkgname=${_basename}-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Interactive duplicate file finder and remover"
arch=('x86_64')
url="https://github.com/${_author}/${_basename}"
license=("MIT")
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar' 'gendesk')
depends=('gtk4' 'libadwaita')
source=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb"
        "${_basename}.png")
sha256sums=('db6c00d9d053bea06fcf95b759c8065d81571d768bc61ecdad1051f721ce91e8'
            '291749f22cb7903244a2a2f0e49ef0c1b5e7a10277fff41e502ba403e622c4a2')

prepare() {
    gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name FClones --categories Utility
}

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    install -Dm644 "${srcdir}/${_basename}.png" "${pkgdir}/usr/share/pixmaps/${_basename}.png"
    install -Dm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"
} 
