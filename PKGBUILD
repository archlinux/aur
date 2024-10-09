# Maintainer: robertfoster

pkgname=ostinato
pkgver=1.3.0
pkgrel=1
url="http://ostinato.org/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
arch=('i686' 'x86_64')
depends=('protobuf' 'qt5-base' 'qt5-script' 'libpcap')
optdepends=('wireshark-cli' 'gzip' 'diffutils' 'awk')
license=(GPL)
source=("https://github.com/pstavirs/ostinato/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname.png")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  QT_SELECT=qt5 qmake PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

sha256sums=('cbc4ff88ccef3bb6fb5d9ae0b4a3d15509e50817435d09d8d37acb903fbf22d5'
  '1afc5727cdd0480a81cc5cd4ae478d0b77086ae4689e3daed44d9693cb874de7'
  'f6cba049e6c2f482298a7a15822cfae22f253289529f55687088fe8fc887a930')
