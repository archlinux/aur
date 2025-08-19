# Maintainer: damir <sudo point pacman at gmail com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: Berkus <berkus@madfire.net>
# Contributor: Daniele Paolella <danielepaolella@email.it>

pkgname=jack-rack
pkgver=1.5.0
pkgrel=1
pkgdesc="Effects rack for JACK"
url="http://jack-rack.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('jack' 'gtk2' 'libxml2' 'ladspa')
optdepends=('lash: JACK session support'
            'ladish: JACK session support'
            'raptor1: LRDF support'
            'liblrdf: LRDF support'
            'python2: ecarack')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b2ee9f33192be9805b7e36925c0fb07e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-lash
  make LDFLAGS='-ldl -lm'
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  make DESTDIR=${pkgdir} install
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' "${pkgdir}/usr/bin/ecarack"
}
 
