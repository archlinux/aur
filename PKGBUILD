# Maintainer: MrRedstonia <contact@mrredstonia.com>
# Installs the ready-made Linux build from the GitHub release (it carries its own Qt).
pkgname=easyboard-app-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Cross-platform soundboard with a virtual microphone input (prebuilt binary)'
arch=('x86_64')
url='https://github.com/MrRedstonia/EasyBoard'
license=('MIT')
# libpulse also brings pactl and parec (virtual inputs, App routing); the rest is for the bundled Qt
depends=('libpulse' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'hicolor-icon-theme')
optdepends=('pipewire-pulse: virtual microphone inputs on PipeWire systems')
provides=('easyboard-app')
conflicts=('easyboard' 'easyboard-app')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/EasyBoard-$pkgver-linux-x86_64.tar.gz")
sha256sums=('39994349b47c2217b3cdaa46e3b6f55d895a6a95f57c0d24139a970d78fd100c')

package() {
  install -d "$pkgdir/opt/easyboard-app" "$pkgdir/usr/bin"
  cp -a "$srcdir/EasyBoard-$pkgver-linux-x86_64/." "$pkgdir/opt/easyboard-app/"
  ln -s /opt/easyboard-app/bin/easyboard "$pkgdir/usr/bin/easyboard"
  install -Dm644 "$pkgdir/opt/easyboard-app/easyboard.desktop" "$pkgdir/usr/share/applications/easyboard.desktop"
  install -Dm644 "$pkgdir/opt/easyboard-app/easyboard.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/easyboard.png"
  rm -f "$pkgdir/opt/easyboard-app/easyboard.desktop" "$pkgdir/opt/easyboard-app/easyboard.png"
  install -Dm644 "$pkgdir/opt/easyboard-app/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/opt/easyboard-app/THIRD-PARTY.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY.md"
}
