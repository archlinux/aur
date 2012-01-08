# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
pkgname=plptools
pkgver=1.0.11
pkgrel=2
pkgdesc="Utilities for communication with EPOC PDAs, e.g. mounting via FUSE"
arch=('i686' 'x86_64')
url="http://plptools.sourceforge.net/"
license=('GPL2')
depends=('fuse')
backup=(etc/conf.d/plptools)
source=(http://downloads.sourceforge.net/project/plptools/plptools/1.0.11/plptools-1.0.11.tar.gz
        plpfuse-x86_64.patch
        plptools.rcd
        plptools.confd)
md5sums=('4779b5dc0a3de3bafbd26350ce0087d4'
         '424867fe9ea319820356c948923fa3ae'
         '7a34e878b9a431cd1c9c3d63fd78edde'
         '084277c3392195c8c49d11c8b1e69c9a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < $srcdir/plpfuse-x86_64.patch
  ./configure --prefix=/usr --with-initdir=/etc/rc.d
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/lib/*.la
  install -Dm644 $srcdir/plptools.confd $pkgdir/etc/conf.d/plptools
  install -Dm755 $srcdir/plptools.rcd $pkgdir/etc/rc.d/plptools
}
