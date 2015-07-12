# Maintainer: DonVla <donvla@users.sourceforge.net>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: Berkus <berkus@madfire.net>
# Contributor: Daniele Paolella <danielepaolella@email.it>
pkgname=jack-rack
pkgver=1.4.7
pkgrel=4
pkgdesc="Effects rack for JACK"
url="http://jack-rack.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('jack' 'gtk2' 'libxml2')
optdepends=('lash: LASH support'
            'raptor1: LRDF support'
            'liblrdf: LRDF support'
            'python2: ecarack')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
 
md5sums=('a29ef4001ee2916a1b758952c936adca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-lash --disable-gnome
  make LDFLAGS='-ldl -lm'
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  make DESTDIR=${pkgdir} install
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' "${pkgdir}/usr/bin/ecarack"
}
 
# vim:set ts=2 sw=2 et:
