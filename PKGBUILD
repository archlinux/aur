# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=xrotor
pkgver=7.55
pkgrel=1
pkgdesc="interactive program for the design and analysis of ducted and free-tip
propellers and windmills"
arch=('i686' 'x86_64')
url="https://web.mit.edu/drela/Public/web/xrotor/"
license=('GPL')
makedepends=('gcc-fortran')
depends=('gcc-libs' 'libx11')
source=('https://web.mit.edu/drela/Public/web/xrotor/Xrotor7.55.tar.tgz')
sha256sums=('7bee104afa0f81ce6ca7ce2205f65943b5e3650105507363f1a628bbca3a075b')

build() {

  cd Xrotor/plotlib
  cp config.make.gfortran config.make
  make libPlt_gfortran.a

  cd ../bin
  cp Makefile.gfortran Makefile
  make xrotor
  make jplot
}

package() {
  install -d "$pkgdir/usr/bin/"
  install -m 0755 "${srcdir}/Xrotor/bin/xrotor" "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/xrotor/"
  install -m 0644 "${srcdir}/Xrotor/README" "$pkgdir/usr/share/xrotor/"
  install -m 0644 "${srcdir}/Xrotor/version_notes.txt" "$pkgdir/usr/share/xrotor/"
  install -m 0644 "${srcdir}/Xrotor/xrotor_doc.txt" "$pkgdir/usr/share/xrotor/"
}
