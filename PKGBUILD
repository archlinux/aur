# Maintainer: ricalditodepollo <richarclarinet at gmail dot com>
_pkgname=balatro-multiplayer-launcher
pkgname=balatro-multiplayer-launcher-AppImage
pkgver=1.0.11
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
  "${url}releases/download/v${pkgver}/balatro-multiplayer-launcher.AppImage"
  "balatro-multiplayer-launcher.desktop"

)
sha256sums=(
  "06add245663e80e88fa287ab096cc5934a5b1d68805416f18e5c73bf6f9dd45a" #AppImage
  "eb906bf72e79c5e481993617a76f33713cd22002bcc64d7fd956a70b4833ad59" #.desktop
)

options=(!strip !debug)

prepare() {
  chmod +x "${srcdir}/balatro-multiplayer-launcher.AppImage"
  #Icon
  "${srcdir}/balatro-multiplayer-launcher.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  install -m755 "${srcdir}/balatro-multiplayer-launcher.AppImage" \
    "${pkgdir}/opt/${_pkgname}/"

  ln -s "/opt/${_pkgname}/balatro-multiplayer-launcher.AppImage" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -m644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/"

  if [ -f "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" ]; then
    install -m644 "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" \
      "${pkgdir}/usr/share/pixmaps/"
  fi
}

