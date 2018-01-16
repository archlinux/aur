# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-make
pkgver=2.7.0
pkgrel=2
pkgdesc="The GNUstep make package"
arch=('x86_64') # See FS#29546
url="http://www.gnustep.org/"
license=('GPL')
depends=()
conflicts=('gnustep-make-svn')
groups=('gnustep-core')
backup=('etc/GNUstep/GNUstep.conf')
source=(ftp://ftp.gnustep.org/pub/gnustep/core/$pkgname-$pkgver.tar.gz)
sha256sums=('90a01cbfb68aafe01c4cc4123121ebd2da0e1e2076795b5682f0833fddf311ce')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  for i in GNUSTEP_SYSTEM_ADMIN_TOOLS GNUSTEP_NETWORK_ADMIN_TOOLS GNUSTEP_LOCAL_ADMIN_TOOLS; do
    sed -i "s|@$i@|/usr/bin|g" GNUstep{,-strict-v2}.conf.in filesystem.{sh,csh,make}.in
  done
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/GNUstep \
    --enable-native-objc-exceptions
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
