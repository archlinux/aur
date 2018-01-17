# $Id$
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-make
pkgver=2.7.0
pkgrel=3
pkgdesc="The GNUstep make package"
arch=('x86_64') # See FS#29546
url="http://www.gnustep.org/"
license=('GPL')
depends=()
conflicts=('gnustep-make-svn')
groups=('gnustep-core')
backup=('etc/GNUstep/GNUstep.conf')
source=(https://github.com/gnustep/tools-make/archive/make-${pkgver//./_}.tar.gz)
sha256sums=('34fb9e848607e6d069bf10141d438c60e04d296a2501b2db1ba6ae28c57dbc56')

prepare() {
  cd "$srcdir"/tools-make-make-${pkgver//./_}
  for i in GNUSTEP_SYSTEM_ADMIN_TOOLS GNUSTEP_NETWORK_ADMIN_TOOLS GNUSTEP_LOCAL_ADMIN_TOOLS; do
    sed -i "s|@$i@|/usr/bin|g" GNUstep{,-strict-v2}.conf.in filesystem.{sh,csh,make}.in
  done
}

build() {
  cd "$srcdir"/tools-make-make-${pkgver//./_}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/GNUstep \
    --enable-native-objc-exceptions
  make
}

package() {
  cd "$srcdir"/tools-make-make-${pkgver//./_}
  make DESTDIR="$pkgdir" install
}

