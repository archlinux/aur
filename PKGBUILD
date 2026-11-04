# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=pail-bin
_pkgname=pail
pkgver=0.4.0
pkgrel=1
pkgdesc="S3 storage manager with a desktop GUI and CLI"
arch=('x86_64')
url="https://github.com/DejavuMoe/Pail"
license=('MIT')
depends=('cairo'
  'fontconfig'
  'gtk-layer-shell'
  'gtk3'
  'libayatana-appindicator'
  'pango'
  'webkit2gtk-4.1')
makedepends=('gendesk')
optdepends=('xdg-utils: opening links in the default browser')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("https://github.com/DejavuMoe/Pail/releases/download/v$pkgver/Pail-v$pkgver-linux-amd64.tar.gz")
sha256sums=('252623084723013fa57811e7ba43647eca3c2ec522e7dde5266dca84fb8bf832')

prepare() {
  gendesk -f -n \
    --pkgname="$_pkgname" \
    --pkgdesc="$pkgdesc" \
    --exec=pail-desktop \
    --categories="Network;Utility" \
    "$startdir/PKGBUILD"
}

package() {
  install -dm755 "$pkgdir"/opt/$_pkgname
  cd "$srcdir"/Pail-v$pkgver-linux-amd64
  install -m755 pail-v$pkgver-linux-amd64 "$pkgdir"/opt/$_pkgname/$_pkgname
  install -m755 pail-desktop-v$pkgver-linux-amd64 "$pkgdir"/opt/$_pkgname/pail-desktop

  install -d "$pkgdir"/usr/bin
  ln -s ../../opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s ../../opt/$_pkgname/pail-desktop "$pkgdir"/usr/bin/pail-desktop

  install -Dm644 "$srcdir"/pail.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 pail.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
