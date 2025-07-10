# Maintainer: ricalditodepollo <richarclarinet at gmail dot com>
pkgname=balatro-multiplayer-launcher
pkgver=1.0.10
pkgrel=1
pkgdesc="Launcher for Balatro Multiplayer Mod"
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
  "d261cb5222bf6f17232e7dc9b5f1e64f30018dc84a07a14fbf8fc2f37cceb4ac" #AppImage
  "eb906bf72e79c5e481993617a76f33713cd22002bcc64d7fd956a70b4833ad59" #.desktop
)

options=(!strip !debug)

prepare() {
  chmod +x "${srcdir}/balatro-multiplayer-launcher.AppImage"
  #Icon
  "${srcdir}/balatro-multiplayer-launcher.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  install -m755 "${srcdir}/balatro-multiplayer-launcher.AppImage" \
    "${pkgdir}/opt/${pkgname}/"

  ln -s "/opt/${pkgname}/balatro-multiplayer-launcher.AppImage" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/"

  if [ -f "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" ]; then
    install -m644 "${srcdir}/squashfs-root/balatro-multiplayer-launcher.png" \
      "${pkgdir}/usr/share/pixmaps/"
  fi
}

