# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
pkgver=0.11.9
pkgrel=3
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
provides=("obsidian")
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron')
makedepends=('asar')
options=(!strip)
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.asar.gz"
)
sha256sums=(
    'e0a6a8f7dfbfff88664621448ac456d47e62c6d94e2cc59702c4f31968780ed4'
    '33e2d337a336711882dd37dff8de63c5c14c75434b58b3ed1cd5eb807cd4ea4c'
    '8f9b6782441c6a3bc31c033cb4bdd1216079a5f337133e1d00ce62b6c63e573c'
)

prepare() {
    cd "$srcdir"
    asar ef ${_pkgname}-${pkgver}.asar icon.png
}

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
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/obsidian.png"
    # Move package contents to opt
    install -Dm644 ${_pkgname}-${pkgver}.asar "${pkgdir}/usr/share/${_pkgname}/app.asar"
}

