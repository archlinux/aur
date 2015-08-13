pkgname=gppcscconnectionplugin
pkgver=1.1.0
gplib=6.0.0
pkgrel=1
pkgdesc="GlobalPlatform pcsc connection plugin"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/globalplatform/"
depends=('glibc' 'pcsclite' 'openssl' 'globalplatform')
source=("https://sourceforge.net/projects/globalplatform/files/GlobalPlatform Library/GlobalPlatform Library ${gplib}/gppcscconnectionplugin-${pkgver}.tar.gz")
options=('!libtool')
md5sums=('616ca9d75620e4652b726b06ae5f44c9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc

  msg "Patching Makefiles"
  sed -i 's/gnu-ldl/gnu/g' Makefile src/Makefile

  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
