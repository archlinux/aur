# Maintainer : Utku Helvacı <utku.helvaci.tux@gmail.com>
# Contributor: oech3

pkgname=voicevox-gpu-appimage
pkgver=0.24.2
pkgrel=1
pkgdesc='Frontend for VOICEVOX TTS Engine'
arch=('x86_64')
license=('nonfree+GPL-3.0-only')
url=https://github.com/VOICEVOX/voicevox
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
replaces=(voicevox-appimage)
source=('voicevox'
${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.001
${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.002
${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.003)
#noextract=(voicevox-linux-nvidia-${pkgver}.tar.gz)
sha256sums=('SKIP'
'7adc38a57f664535ed181d2cb556e23f8d8ec7d1cc57dface8f0f55c3c0d7229'
'679598de80e820e94946e3b1820bb04c063179f27042f9175ef38ad854983254'
'edcd881679feb54bdf048895c0288992e45da272a9792d3cdfb359f8635576f0')

makedepends=(7zip)

package() {
  7z -aoa x VOICEVOX.AppImage.7z.001
  ./VOICEVOX.AppImage --appimage-extract voicevox.desktop
  ./VOICEVOX.AppImage --appimage-extract usr/share/icons/hicolor/256x256/apps/voicevox.png
  install -Dm755 voicevox "$pkgdir"/usr/bin/voicevox
  install -Dm644 squashfs-root/voicevox.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/voicevox.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/voicevox.png
  install -Dm755 VOICEVOX.AppImage "$pkgdir"/opt/appimages/VOICEVOX.AppImage
}
