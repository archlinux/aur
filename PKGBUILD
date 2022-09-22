# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=2.0.1
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://github.com/ariadnavigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ariadnavigo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d446991416f50600a36d5bd2910214a7a31db46ab33de200ab7c24fc176070959a9699881d9661497aab131a8f7b1691c76540b1c1de8c4a718689c61afb7743')

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
