# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.4.6
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(x86_64)
license=('LGPL')
url="https://wiki.gnome.org/Projects/libepc"
depends=('gtk3' 'avahi' 'libsoup')
makedepends=('intltool' 'python')
source=(https://download.gnome.org/sources/$pkgname/0.4/$pkgname-$pkgver.tar.xz)
sha256sums=('215990847a8526c85774cb74fbcaea4c46866df58281b21dce5a62aac5da7ae8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
