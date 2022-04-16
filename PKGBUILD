# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=1.1.2
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('81193aecb0871ed2c35268074d3348f304012f4511e8306621cf1d57848ea7b217277e6bebe5a0e7cbc7bc698ef6b4fd165125032a6598e48cc5b9447e73d4b5')

build() {
  cd "$pkgname-$pkgver"
  sed -i "s/LDFLAGS.*$/&,-z,now/" config.mk
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
