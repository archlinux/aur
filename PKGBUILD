# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=1.0.1
pkgrel=0
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f938d1fcf895c1c3041c76e551c4efd14bb4f0c444cda93aa026af4a9448634dc0283433af87da0bebfa212857c00693520fa09b4e87cc4baf25e7a4909ab720')

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
