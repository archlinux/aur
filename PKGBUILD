pkgname=animeko-appimage
_pkgname=animeko
pkgver="5.3.2"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d2.myani.org/v${pkgver//_/-}/ani-${pkgver//_/-}-linux-${CARCH}.appimage")
sha512sums_x86_64=('02a1b92eb8f9442b05115b1a108437a55def97aa4d201f2664c9720c129a0053657020984334e8ab91349082e61111e60db99d600a8c8e15182ba496e8eec7b7')
depends=('vlc-plugin-ffmpeg' 'vlc-plugin-dvb' 'vlc-plugin-pulse' 'gvfs' 'fuse2')
conflicts=('animeko')
provides=('animeko')
options=('!strip')
noextract=("ani-${pkgver//_/-}-linux-${CARCH}.appimage")

prepare() {
  chmod +x "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage"
  "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage" --appimage-extract
  sed -i -E "s|Exec=Ani|Exec=/opt/${_pkgname}/${_pkgname}.AppImage|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
  sed -i -E "s|Icon=icon|Icon=${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -d "${pkgdir}/usr/share/applications"

    install -Dm755 "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

