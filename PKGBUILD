# Maintainer: Martin Etchebarne <martin@etchebarne.net>
pkgname=kosmos-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A code editor where every view is a tab you can place anywhere."
arch=('x86_64')
url="https://github.com/etchebarne/kosmos"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
provides=('kosmos')
conflicts=('kosmos')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Kosmos-${pkgver}-x86_64.AppImage"
    "kosmos-512.png::${url}/raw/v${pkgver}/desktop/assets/icon/icon-512.png"
    "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('abc906b37331b61ed357e92ad5a2a4301528f8364323b43d6c021fadaa86f881' '2f43bcbd97904721ca9e63eea313f9e9de0ac3981929f3f868fc390796340704' '7abf5af0868286f95c0a3e42d820deead6cc0ae9a3f0a65f72e319ab730c146e')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/kosmos/Kosmos.AppImage"
    install -Dm644 "${srcdir}/kosmos-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/kosmos.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/kosmos" <<'SH'
#!/usr/bin/env sh
exec /opt/kosmos/Kosmos.AppImage "$@"
SH

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/kosmos.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Kosmos
Comment=A code editor where every view is a tab you can place anywhere.
Exec=kosmos
Icon=kosmos
Terminal=false
Categories=Development;IDE;TextEditor;
StartupWMClass=kosmos
DESKTOP
}
