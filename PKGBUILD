pkgname=changewall
pkgver=0.1.0
pkgrel=1
pkgdesc="Animated KDE Plasma wallpaper switcher"
arch=('x86_64')
url="https://github.com/villawebcl/changewall"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'kglobalaccel' 'plasma-workspace')
makedepends=('qt6-base')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c987e964cf9d48dc1cc59575340adae75fb7d196c63b0f474679d25874f6eed')

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
