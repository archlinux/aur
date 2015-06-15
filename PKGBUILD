# Submitter: Guenther Starnberger <gst@sysfrog.org>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=globalplatform
pkgver=6.0.0
pkgrel=2
pkgdesc="GlobalPlatform libraries"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/globalplatform/"
depends=('glibc' 'pcsclite' 'openssl')
source=(http://downloads.sourceforge.net/globalplatform/globalplatform-${pkgver}.tar.gz)
options=('!libtool')
md5sums=('881e12663923952fcc94f5eeae47bcd2')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc

  msg "Patching Makefiles"
  sed -i 's/gnu-ldl/gnu/g' Makefile src/Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
