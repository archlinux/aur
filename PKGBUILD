pkgname=ferrumkix-bin
pkgver=0.9.7
pkgrel=4
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
source=("FerrumKix-${pkgver}-${pkgrel}-linux-x64.zip::https://github.com/Bitpainter75/FerrumKix/releases/download/latest/FerrumKix-${pkgver}-${pkgrel}-linux-x64.zip"
        'io.github.Bitpainter75.FerrumKix.desktop' 'io.github.Bitpainter75.FerrumKix.png')
noextract=("FerrumKix-${pkgver}-${pkgrel}-linux-x64.zip")
sha256sums=('90ea674901bf8ce8789aaafbbdd40d6277906fb87443d82a6fe3cf0c453844be' '7012e15c2b82d0e0c0446d0f751c95541307bce2205a6604965c8ede1e81cde4' 'c20d42ee7a0540237fc93744c125041f160b5e1235cbadd0ff47989c254f7783')
prepare() { rm -rf "$srcdir/FerrumKix-${pkgver}"; mkdir -p "$srcdir/FerrumKix-${pkgver}"; bsdtar -xf "$srcdir/FerrumKix-${pkgver}-${pkgrel}-linux-x64.zip" -C "$srcdir/FerrumKix-${pkgver}"; }
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
