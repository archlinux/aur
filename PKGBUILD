# Maintainer: Whovian9369 <Whovian9369 at gmail dot com>
# Contributor: mock <nobody at nowhere dot co dot uk>
pkgname=clrmamepro
pkgver=4.036a
pkgrel=1
pkgdesc="A ROM manager for MAME."
arch=('x86_64'
      'i686')
url="https://mamedev.emulab.it/clrmamepro/"
license=('custom')
depends=('wine' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('icoutils')
source=("https://mamedev.emulab.it/clrmamepro/binaries/cmp${pkgver//./}_32.zip"
        "clrmamepro"
        "clrmamepro.desktop")
sha256sums=('075aba6b2ef878ec8db32d05f4dd219df1003b14ce2683499e706a5d85b446be'
            '497a4a5cfe5daf8ac576f8169e611c6433b73e5019a7a8e4b0a230e531f9cdc4'
            '830794b34205387cf69594cf555698ae888574a2f0dcbe63e7e49d1d40dcdeff')

build() {
  wrestool -x -n 500 -o . cmpro.exe
  icotool -x -o . cmpro.exe_14_500_1031.ico
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/clrmamepro/" "7z_32.dll" \
    "engine.cfg" \
    "unrar.dll" \
    "update.dll" \
    "cmpro.exe" \
    "stats.ini" \
    "urls.ini" \
    "version.ini" \
    "setformat.xml"

  install -Dm755 "clrmamepro" "${pkgdir}/usr/bin/clrmamepro"

  install -Dm644 "clrmamepro.desktop" "${pkgdir}/usr/share/applications/clrmamepro.desktop"

  install -Dm644 "cmpro.exe_14_500_1031_4_16x16x32.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/clrmamepro.png"
  install -Dm644 "cmpro.exe_14_500_1031_5_32x32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/clrmamepro.png"
  install -Dm644 "cmpro.exe_14_500_1031_6_48x48x32.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/clrmamepro.png"

  install -Dm644 "copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
