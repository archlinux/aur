# Maintainer: ricalditodepollo <richarclarinet at gmail dot com>
_pkgname=balatro-multiplayer-launcher
pkgname=balatro-multiplayer-launcher
pkgver=1.0.13
pkgrel=1
pkgdesc="Launcher for Balatro Multiplayer Mod (AppImage)"
arch=('x86_64')
url="https://github.com/Balatro-Multiplayer/Balatro-Multiplayer-Launcher/"
license=(" ")

depends=(
  'fuse2'
  'nss'
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'libsecret'
  "alsa-lib"
  "cups"
  "dbus"
  "zlib"
  "libdrm"
  "libx11"
  "libxcb"
  "libxkbcommon"
)

source=(
  "${pkgname}-${pkgver}.AppImage::${url}releases/download/v${pkgver}/balatro-multiplayer-launcher.AppImage"
  "balatro-multiplayer-launcher.desktop"

)
sha256sums=(
  "4e1874c4e4db6967b0d8b3df117981b0c7827012cfa29ba5384f660d98c463fc" #AppImage
  "eb906bf72e79c5e481993617a76f33713cd22002bcc64d7fd956a70b4833ad59" #.desktop
)

options=(!strip !debug)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  #Icon
  "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  install -m755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${_pkgname}/"

  ln -s "/opt/${_pkgname}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -m644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/"

  if [ -f "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" ]; then
    install -m644 "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" \
      "${pkgdir}/usr/share/pixmaps/"
  fi
}
