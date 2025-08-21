# Maintainer: Michael Rydén (zynex(at)zoik.se)
# App: RenameMyTVSeries (GTK2)
# Version: 2.3.8

pkgname=renamemytvseries-gtk-bin
_pgmname=RenameMyTVSeries
pkgver=2.3.8
pkgrel=1
pkgdesc="Rename your TV-Series using TheTVDB (GTK2 version)"
arch=('x86_64')
url="https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/"
license=('custom')
depends=('ffmpeg' 'gtk2')
provides=('renamemytvseries')
conflicts=('renamemytvseries')
options=('!debug')
source=(
  'LICENSE'
  "https://www.tweaking4all.com/downloads/video/${_pgmname}-${pkgver}-GTK-Linux-x64-shared-ffmpeg.tar.xz"
)
sha256sums=(
  '986a80aff89e697188bb4eb9f8bfa511c1e933f1e2edd54a3315069c56fec160'
  '346263bd1693b157e79b1360476f88ed842dab7fced78e5476a7617fd49ed645'
)

package() {
  install -Dm755 "$srcdir/$_pgmname" "$pkgdir/usr/bin/$_pgmname"

  for size in 16 32 64 128 256 512; do
    install -Dm644 "$srcdir/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/renamemytvseries.png"
  done

  install -Dm644 "$srcdir/${_pgmname}.desktop" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pgmname|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Icon=.*|Icon=renamemytvseries|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i '/^NoDisplay=true$/d' "$pkgdir/usr/share/applications/${_pgmname}.desktop"

  if [[ -f "$srcdir/rmtv.ttf" ]]; then
    install -Dm644 "$srcdir/rmtv.ttf" "$pkgdir/usr/share/fonts/TTF/rmtv.ttf"
  fi

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${_pgmname}/LICENSE"
}
