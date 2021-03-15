# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
_appimagver=0.11.7
_appimage="${_pkgname}-${_appimagver}.asar.gz"
pkgver=${_appimagver//-/_}
pkgrel=1
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
provides=("obsidian")
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron')
options=(!strip)
source=( 
  "${pkgname}"
  "${pkgname}.desktop"
  "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.asar.gz"
)
sha256sums=('38d18cc7f3c6aacaba37aecb2c27754ad6562be121d23d6eeeeeccfb85234d04'
            '8cd2bac969bf0b394c5766a26985759ec5bc6d6cf5ce0316920dce095d964041'
            '212400b69331b5d5b3af3388940d87e91250b37678c0c178a06f20902ffa4c29')

package() {
    # Go to source directory
    cd "$srcdir"

    # Create directories for installation
    install -dm0755 "${pkgdir}/usr/bin"
    install -dm0755 "${pkgdir}/opt"

    # Install executable file
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/"
    # Install desktop file
    install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications/"
    # Move package contents to opt
    install -Dm644 ${_pkgname}-${pkgver}.asar  "${pkgdir}/opt/${pkgname}/obsidian.asar"
}

