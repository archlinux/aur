# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=gio-sharp
pkgver=0.3
pkgrel=3
pkgdesc="Mono bindings to Glib's libgio"
arch=('any')
url="https://github.com/mono/gio-sharp"
license=('MIT')
depends=('gtk-sharp-2')
source=($pkgname-$pkgver.tar.gz::https://github.com/mono/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('25142dd9f2cfa984acf10a579fb771612f46ae4c089b65e059d72a403a2fc1d5')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/CSC, gmcs/CSC, mcs/' configure.ac.in
  NOCONFIGURE=1 ./autogen-2.22.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
