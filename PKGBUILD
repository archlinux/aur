# Maintainer: Michael Rydén (zynex(at)ezmail.se)
# App: RenameMyTVSeries (GTK2)
# Version: 2.3.5

pkgname=renamemytvseries-gtk-bin
_pgmname=RenameMyTVSeries
pkgver=2.3.5
pkgrel=1
pkgdesc="Rename your TV-Series using TheTVDB (GTK2 version)"
arch=('x86_64')
url="https://www.tweaking4all.com/home-theatre/rename-my-tv-series-v2/"
license=('custom')
depends=('ffmpeg' 'gtk2')
provides=('renamemytvseries')
conflicts=('renamemytvseries')

source=(
  'LICENSE'
  "https://www.tweaking4all.com/downloads/video/${_pgmname}-${pkgver}-GTK-Linux-x64-shared-ffmpeg.tar.xz"
)
sha256sums=(
  '986a80aff89e697188bb4eb9f8bfa511c1e933f1e2edd54a3315069c56fec160'
  '04cc4f5d15d53cbce9b077b4d7f93905e278d480aab14fca45a2c412c701a9e9'
)

package() {
  # Installera binären
  install -Dm755 "$srcdir/$_pgmname" "$pkgdir/usr/bin/$_pgmname"

  # Installera ikoner till rätt systemkataloger
  for size in 16 32 64 128 256 512; do
    install -Dm644 "$srcdir/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/renamemytvseries.png"
  done

  # Installera .desktop-fil
  install -Dm644 "$srcdir/${_pgmname}.desktop" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pgmname|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i "s|Icon=.*|Icon=renamemytvseries|" "$pkgdir/usr/share/applications/${_pgmname}.desktop"
  sed -i '/^NoDisplay=true$/d' "$pkgdir/usr/share/applications/${_pgmname}.desktop"

  # Installera font om den finns (kan saknas i vissa versioner)
  if [[ -f "$srcdir/rmtv.ttf" ]]; then
    install -Dm644 "$srcdir/rmtv.ttf" "$pkgdir/usr/share/fonts/TTF/rmtv.ttf"
  fi

  # Installera licens
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${_pgmname}/LICENSE"
}
