# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=toss
pkgver=1.1
pkgrel=1
pkgdesc='Dead simple LAN file transfers from the command line'
arch=('x86_64')
url='https://github.com/zerotier/toss'
license=('MIT')
source=("https://github.com/zerotier/toss/archive/$pkgver.tar.gz")
sha256sums=('49a712f488e46731277319bbf9153565d99209579dd6b039efdebf76c118f6f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/-Wno-unused-function/-Wno-unused-function­-Wl\,-z\,relro -Wl\,-z\,now/" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 toss "$pkgdir/usr/bin/toss"
  install -Dm755 catch "$pkgdir/usr/bin/catch"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/toss/LICENSE.txt"
}

