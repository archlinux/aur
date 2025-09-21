# Contributor: ich <remove dashes in s-c--25-ni at gmail dot com>

pkgname=voicevox-appimage
pkgver=0.24.2
pkgrel=1
pkgdesc='Offical Frontend for the free VOICEVOX TTS Engine'
arch=('x86_64')
license=('LGPLv3' 'custom')
url=https://github.com/VOICEVOX/voicevox
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})

_installdir=/opt/appimages
_pkgname=VOICEVOX.AppImage

source=(${url}/releases/download/${pkgver}/VOICEVOX.AppImage.7z.00{1..3})
sha256sums=('7adc38a57f664535ed181d2cb556e23f8d8ec7d1cc57dface8f0f55c3c0d7229'
            '679598de80e820e94946e3b1820bb04c063179f27042f9175ef38ad854983254'
            'edcd881679feb54bdf048895c0288992e45da272a9792d3cdfb359f8635576f0')
depends=(glibc libsndfile)
makedepends=(7zip)
options=('!strip' '!debug')

package() {
  7z -y x VOICEVOX.AppImage.7z.001
  7z -y x VOICEVOX.AppImage voicevox.desktop usr/share/icons/hicolor/256x256/apps/voicevox.png

  install -d "$pkgdir"/usr/{bin,share/{applications,pixmaps}}
  # move for faster install
  mv VOICEVOX.AppImage "$pkgdir"/usr/bin/voicevox
  mv usr/share/icons/hicolor/256x256/apps/voicevox.png -t "$pkgdir"/usr/share/pixmaps
  sed "s/Exec=.*/Exec=voicevox/" voicevox.desktop > "$pkgdir"/usr/share/applications/voicevox.desktop
}
