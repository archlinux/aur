# Maintainer: Sylvain Bx <sylvain.b@public.sbx.pm>

pkgname=around
pkgver=0.61.17
pkgrel=1
pkgdesc="Video conferencing with AI-based camera framing."
arch=('x86_64')
url='https://www.around.co/'
license=('unknown')
depends=('fuse2')
options=("!strip")
_appimage="Around.AppImage"
_icon="62425723"
source=("https://downloads.around.co/${_appimage}" "https://avatars.githubusercontent.com/u/${_icon}")
noextract=("${_appimage}")
sha256sums=("a6b6767c0c09a775e395b069c9f603f24aef809555fb7cc8c2d3da633413fa8e" "60d9081bbf0cfc6af58973d54e68c286d7ac3b21e875fef8f811c5114f34c7dc")
prepare() {
    cat > "${srcdir}/${pkgname}.desktop" <<EOL
[Desktop Entry]
Name=Around
Comment=Around.co linux client
Exec="/opt/${pkgname}/${_appimage}" %U
Terminal=false
Type=Application
Categories=Network;Application;
Icon=${pkgname}.png
EOL
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Install icon
    install -Dm644 "${srcdir}/${_icon}" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Create shortcut
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

