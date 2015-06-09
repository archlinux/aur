# $Id$
# Maintainer: Sean Bolton musound at jps dot net
# Contributor:  Thomas Karmann <thomas@karmann-paf.de>
pkgname=xsynth-dssi
pkgver=0.9.4
pkgrel=2
pkgdesc="An analog-style (VCOs-VCF-VCA) synth plugin for DSSI"
arch=('i686' 'x86_64')
url="http://dssi.sourceforge.net/download.html#Xsynth-DSSI"
license=('GPL')
depends=('gtk2' 'liblo>=0.22')
makedepends=('dssi')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/dssi/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        xsynth-dssi)
md5sums=('3432ecdac06407a992f80eb1c1ecf7cd'
         'c346e6a944f202fccb2278b77a5e184b')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
  install -D -m755 ${srcdir}/xsynth-dssi ${pkgdir}/usr/bin/xsynth-dssi
}

