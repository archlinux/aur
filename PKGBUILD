# Maintainer: Jan Hambrecht <jaham at gmx dot net>

pkgname=spnavcfg
pkgver=0.3.1
pkgrel=3
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="https://github.com/FreeSpacenav/spnavcfg"
license=('GPL')
depends=(gtk2)
makedepends=('gcc' 'make')
provides=('spnavcfg')
options=()
install=
source=(https://github.com/FreeSpacenav/spnavcfg/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        Makefile.in.diff)
md5sums=('bf5bda8e4fd3fa3e45fe47cd26394fae'
         'b85402ad686e3ef10446c192166c3a0a')
build() {
  cd ${pkgname}-${pkgver}
  patch -p0 < $startdir/Makefile.in.diff
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}
