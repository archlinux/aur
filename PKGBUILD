# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=1.1.0
pkgrel=0
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('bc5120214e2df0b936df307f3cab07fd4a3bca758490350fddb8e0c8fdce43d06ed94a545c3a4d66232909f36e722c40d802bcab45935885f7a436db00b73af4')

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
