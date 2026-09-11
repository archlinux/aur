pkgname=ferrumplay-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Desktop music player with album-grouped playlists and Audio CD support'
arch=('x86_64')
url='https://github.com/Bitpainter75/FerrumPlay'
license=('GPL-3.0-only')
depends=('glibc' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm' 'mpv')
provides=('ferrumplay')
conflicts=('ferrumplay')
options=('!strip')
source=("FerrumPlay-${pkgver}-${pkgrel}-linux-x64-aur.zip::https://github.com/Bitpainter75/FerrumPlay/releases/download/${pkgver}/FerrumPlay-${pkgver}-${pkgrel}-linux-x64-aur.zip"
        'io.github.Bitpainter75.FerrumPlay.desktop' 'io.github.Bitpainter75.FerrumPlay.png')
noextract=("FerrumPlay-${pkgver}-${pkgrel}-linux-x64-aur.zip")
sha256sums=('d5c46de77c7698f1d1312ff855ab798b9227de6d3369914f7c6969d7dcb14493' '6d59170c7e8756fa9bf310bb018a4df24bbd117895d003281dd98f86ca756ebd' 'c20d42ee7a0540237fc93744c125041f160b5e1235cbadd0ff47989c254f7783')
prepare() { rm -rf "$srcdir/FerrumPlay-${pkgver}"; mkdir -p "$srcdir/FerrumPlay-${pkgver}"; bsdtar -xf "$srcdir/FerrumPlay-${pkgver}-${pkgrel}-linux-x64-aur.zip" -C "$srcdir/FerrumPlay-${pkgver}"; }
package() {
  install -dm755 "$pkgdir/opt/ferrumplay" "$pkgdir/usr/bin"
  cp -a "$srcdir/FerrumPlay-${pkgver}/." "$pkgdir/opt/ferrumplay/"
  install -Dm644 "$pkgdir/opt/ferrumplay/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/opt/ferrumplay/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  rm -f "$pkgdir/opt/ferrumplay/"{*.desktop,*.png}; chmod +x "$pkgdir/opt/ferrumplay/FerrumPlay"
  ln -s /opt/ferrumplay/FerrumPlay "$pkgdir/usr/bin/ferrumplay"
  install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPlay.desktop" "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPlay.desktop"
  install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPlay.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPlay.png"
}
