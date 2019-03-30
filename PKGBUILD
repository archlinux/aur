# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=gkeyfile-sharp
pkgver=0.1
_pkgver=GKEYFILE_SHARP_0_1
pkgrel=4
pkgdesc="Mono bindings for GLib’s GKeyFile"
arch=('any')
url="https://github.com/mono/gkeyfile-sharp"
license=('LGPL')
depends=('gtk-sharp-2')
source=($pkgname-$pkgver.tar.gz::https://github.com/mono/$pkgname/archive/$_pkgver.tar.gz)
sha256sums=('e74cb8ab118f344a15215aeb1cf66ef2a6992f49a1eca1c839fffefaa61ac485')

prepare() {
  cd $pkgname-$_pkgver
  sed -i 's/CSC, gmcs/CSC, mcs/' configure.in
  aclocal
  automake --add-missing --gnu
  autoconf
}

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
}
