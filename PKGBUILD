pkgname=ferrumkix-bin
pkgver=0.9.6
pkgrel=1
pkgdesc='Desktop music player with album-grouped playlists and Audio CD support'
arch=('x86_64')
url='https://github.com/Bitpainter75/FerrumKix'
license=('GPL-3.0-only')
depends=('glibc' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm' 'mpv' 'ffmpeg' 'cdparanoia')
provides=('ferrumkix')
# Umbenennung von FerrumPlay: der alte Paketname wird abgeloest, nicht danebengestellt.
conflicts=('ferrumkix' 'ferrumplay-bin' 'ferrumplay')
replaces=('ferrumplay-bin' 'ferrumplay')
options=('!strip')
source=("FerrumKix-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumKix/releases/download/${pkgver}/FerrumKix-${pkgver}-${pkgrel}-linux-x64-aur.zip"
        'io.github.Bitpainter75.FerrumKix.desktop' 'io.github.Bitpainter75.FerrumKix.png')
noextract=("FerrumKix-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('cf5c96ccf5e7ba7c8b62bda2964a43c82af0873c394624f654328cb4e14a4947' '7012e15c2b82d0e0c0446d0f751c95541307bce2205a6604965c8ede1e81cde4' '910a8726cd79d8698477fb4dcc00144aec1bb82b91aac9007ede64c611d5e963')
prepare() { rm -rf "$srcdir/FerrumKix-${pkgver}"; mkdir -p "$srcdir/FerrumKix-${pkgver}"; bsdtar -xf "$srcdir/FerrumKix-${pkgver}-${pkgrel}-linux-x64-aur.zip" -C "$srcdir/FerrumKix-${pkgver}"; }
package() {
  install -dm755 "$pkgdir/opt/ferrumkix" "$pkgdir/usr/bin"
  cp -a "$srcdir/FerrumKix-${pkgver}/." "$pkgdir/opt/ferrumkix/"
  install -Dm644 "$pkgdir/opt/ferrumkix/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/opt/ferrumkix/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  rm -f "$pkgdir/opt/ferrumkix/"{*.desktop,*.png}; chmod +x "$pkgdir/opt/ferrumkix/FerrumKix"
  ln -s /opt/ferrumkix/FerrumKix "$pkgdir/usr/bin/ferrumkix"
  install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumKix.desktop" "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumKix.desktop"
  install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumKix.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumKix.png"
}
