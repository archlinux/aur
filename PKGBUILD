# Maintainer: Dylan Schacht (deadhead)

pkgname=opensnap
pkgver=0.1
pkgrel=1
pkgdesc='Aero Snap Funcionality In Openbox'
url='https://github.com/lawl/opensnap'
arch=('i686' 'x86_64')
depends=('wmctrl')
source=(git+https://github.com/lawl/opensnap.git)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's!/usr/bin/!${DESTDIR}/usr/bin!' Makefile
  sed -i 's!/etc/opensnap!${DESTDIR}/etc/opensnap!' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/etc"
  make DESTDIR="${pkgdir}" USRBINDIR="${pkgdir}"/usr/bin install
}
