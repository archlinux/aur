# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: RenameMyTVSeries (QT5)
# Version: 2.3.10

pkgname=renamemytvseries-qt-bin
_pgmname=RenameMyTVSeries
pkgver=2.3.10
pkgrel=1
pkgdesc="Rename your TV-Series using TheTVDB (QT5 version)"
arch=('x86_64')
url="https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/"
license=('custom')
depends=('ffmpeg' 'qt5pas' 'qt5-base')
provides=('renamemytvseries')
conflicts=('renamemytvseries')
options=('!debug')
source=(
  'LICENSE'
  "https://www.tweaking4all.com/downloads/video/${_pgmname}-${pkgver}-QT5-Linux-x64-shared-ffmpeg.tar.xz"
)
sha256sums=(
  '986a80aff89e697188bb4eb9f8bfa511c1e933f1e2edd54a3315069c56fec160'
  '068f1bbaa99227ba03c59338df7655792aaef6c23e9122e516a132bb34811d3f'
)

package() {
  install -Dm755 "$srcdir/$_pgmname" "$pkgdir/usr/bin/$_pgmname"

  for size in 16 32 64 128 256 512; do
    install -Dm644 "$srcdir/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/renamemytvseries.png"
  done

  install -Dm644 "$srcdir/${_pgmname}.desktop" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Exec=.*|Exec=env QT_QPA_PLATFORM=xcb /usr/bin/$_pgmname|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Icon=.*|Icon=renamemytvseries|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i '/^NoDisplay=true$/d' "$pkgdir/usr/share/applications/${_pgmname}.desktop"

  install -Dm644 "$srcdir/rmtv.ttf" "$pkgdir/usr/share/fonts/TTF/rmtv.ttf"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${_pgmname}/LICENSE"
}
