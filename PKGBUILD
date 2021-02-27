# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
_appimagver=0.11.4
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
            'a6d3401a9a2513c85fb6530c350df35f69312dbe667d5a30deadb2683dd1c907')

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

