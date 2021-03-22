# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
_appimagver=0.11.9
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
  "https://raw.githubusercontent.com/flathub/md.obsidian.Obsidian/master/md.obsidian.Obsidian.png"
)
sha256sums=('38d18cc7f3c6aacaba37aecb2c27754ad6562be121d23d6eeeeeccfb85234d04'
            '0e132cb981e7c94b2116e94b18c6b7fcb1431be690a03b95247a5ef929ef3275'
            '8f9b6782441c6a3bc31c033cb4bdd1216079a5f337133e1d00ce62b6c63e573c'
	    '4126aded6abd6428af74941a38eded04c867639a757023cd67d3de094f7856e3')

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
    install -Dm644 md.obsidian.Obsidian.png "${pkgdir}/usr/share/pixmaps/obsidian.png"
    # Move package contents to opt
    install -Dm644 ${_pkgname}-${pkgver}.asar  "${pkgdir}/opt/${pkgname}/obsidian.asar"
}

