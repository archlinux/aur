# Maintainer: Sylvain Bx <sylvain.b@public.sbx.pm>

pkgname=around
pkgver=0.57.12
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
sha256sums=("80666c8da74da60abdd8ec467a8be44c2e0f87a15d2f87c200661f2e32472ec1" "4707fb49bf3a54dae37a2bd1ea9eb2b634db56ad896670c9255d49548a18a79b")
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

