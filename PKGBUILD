# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=1.1.3
pkgrel=2
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://github.com/ariadnavigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ariadnavigo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('aac912c23e97ac2ba824adbc608dcfdcf689ff7a96339840e14c30d3df3038cb1ce8fb063a6bfba9d80c6ded355d9464e9a70a94a0c5a5706aee2f772fbde9c9')

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
