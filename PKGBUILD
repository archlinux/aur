pkgname=changewall
pkgver=0.1.1
pkgrel=1
pkgdesc="Animated KDE Plasma wallpaper switcher"
arch=('x86_64')
url="https://github.com/villawebcl/changewall"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'kglobalaccel' 'plasma-workspace')
makedepends=('qt6-base')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16ada82d0ac23a20ce0256c5540fc6f3bf83d2ac02b1093fcc9b47dcbc2e5487')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake6 changewall.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm755 scripts/install-user.sh "$pkgdir/usr/share/changewall/install-user.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
