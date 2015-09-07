# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=vkeybd
pkgver=0.1.18d
pkgrel=2
pkgdesc="A virtual MIDI keyboard for X"
arch=(i686 x86_64)
url="http://www.alsa-project.org/~tiwai/alsa.html#vkeybd"
license=('GPL')
depends=('alsa-lib' 'tk')
source=(ftp://ftp.suse.com/pub/people/tiwai/vkeybd/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5c7bd16e2903866f949879b885953a2b')
sha256sums=('aa683ed57592489e05fdd898368abe3ee245a4d5829385cfe5edb81764590704')

prepare() {
  cd ${srcdir}/${pkgname}
  # we have tcl version 8.6
  sed -i -e "s;8.4;8.6;" ${srcdir}/${pkgname}/Makefile
}

build() {
  cd ${srcdir}/${pkgname}
  make PREFIX=/usr || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  make PREFIX=/usr DESTDIR=${pkgdir} install-all || return 1
}
