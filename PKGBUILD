# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=unbuffered
pkgver=0.5.2
pkgrel=1
pkgdesc="Copy stdin to stdout and stderr, unbuffered"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('GPL2+')
depends=('glibc')
changelog='ChangeLog'
source=(${pkgname}-${pkgver}::'git+https://github.com/hilbix/unbuffered.git#commit=f3004614e5da8bcdec2007c0eb98a61c5101ea20')
sha512sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  git submodule update --init
  make ${pkgname}_version.h
  sed -i 's/\r//' $srcdir/${pkgname}-${pkgver}/unbuffered_version.h
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  make INSTALLPATH=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
