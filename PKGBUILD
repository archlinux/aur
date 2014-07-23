# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Judd <jvinet at zeroflux dot org>
# Contributor: Elia Yehuda <z4ziggy at user-contributions dot org>

pkgname=lshwd
pkgver=1.1.3
pkgrel=7
pkgdesc="lists hardware and approp modules"
arch=('i686' 'x86_64')
url="http://user-contributions.org/projects/lshwd/"
license=('GPL')
depends=('libusb-compat' 'pciutils')
source=(http://user-contributions.org/projects/lshwd/source/${pkgname}-${pkgver}.tar.gz
	lshwd-1.1.3-fixes.patch
	hwd
	Cards
	pcitable
	pcmciatable
	usbtable)
md5sums=('493ae06aada341f0bde063aab3c4167f'
         'e7c4cdd75aa75aae140f6c578109b830'
         '42d52005cce7b05c528d07424313769e'
         'bf672bb7288d67ec5bc1502390d810ca'
         '93099e0be779545b0b82b880293b7a7f'
         'f0819596a4d9ee67c728f40c0a78d662'
         '244b6b223b42b36a22040cc1c453509c')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np2 -b -z .orig -i ${srcdir}/lshwd-1.1.3-fixes.patch
  cp ${srcdir}/Cards .
  cp ${srcdir}/{pci,pcmcia,usb}table .
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}
  install -D -m755 hwd ${pkgdir}/etc/rc.d/hwd
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/lshwd ${pkgdir}/usr/bin/lshwd
  install -D -m644 pcitable ${pkgdir}/usr/share/hwdata/pcitable
  install -D -m644 usbtable ${pkgdir}/usr/share/hwdata/usbtable
  install -D -m644 pcmciatable ${pkgdir}/usr/share/hwdata/pcmciatable
  install -D -m644 Cards ${pkgdir}/usr/share/hwdata/Cards
}

# for latest table/Cards files checkout hwd site :
# http://user-contributions.org/projects/lshwd/tables/
