# Maintainer: Luke Bubar <luke@coldmail.xyz>
pkgname=soh-bin
pkgver=9.3.1
pkgrel=1
_codename=Dewey-Bravo
pkgdesc="An unofficial PC port of The Legend of Zelda: Ocarina of Time"
arch=('x86_64')
url="https://www.shipofharkinian.com"
license=('custom')
depends=('fuse2' 'sdl2' 'libpng' 'libzip' 'lsb-release')
optdepends=(
    'zenity: for file picker dialogs'
    'kdialog: for file picker dialogs (KDE)'
)
provides=('soh')
conflicts=('soh' 'soh-git')
options=('!strip')
source=("soh-${pkgver}.appimage::https://github.com/HarbourMasters/Shipwright/releases/download/${pkgver}/SoH-${_codename}.appimage"
        "soh.desktop"
        "soh.png::https://raw.githubusercontent.com/HarbourMasters/Shipwright/develop/soh/macosx/sohIcon.png")
sha256sums=('e4bb775c9a0c3629ebac57e4b6ccba6d0b621d71ab201e9105aceef9141ad1f4'
            'd2aa81872c6176dd747bee8962a27371b090ac8904bb12352660127092e3792a'
            '33ffca9a886629700bce92f334d3d460da48f41b2194854c0280dea3f6451850')
noextract=("soh-${pkgver}.appimage")

package() {
    install -Dm755 "soh-${pkgver}.appimage" "${pkgdir}/opt/soh/soh.appimage"
    install -Dm644 "soh.desktop" "${pkgdir}/usr/share/applications/soh.desktop"
    install -Dm644 "soh.png" "${pkgdir}/usr/share/pixmaps/soh.png"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/soh" << 'EOF'
#!/bin/sh
exec /opt/soh/soh.appimage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/soh"
}
