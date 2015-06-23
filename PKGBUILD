# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>
# Maintainer: Yarema aka Knedlyk <yarpry at gmail dot com>

pkgname=oxine-vdr
pkgver=0.7.1
pkgrel=2
pkgdesc="Oxine is a lightweight pure OSD (on screen display) GUI for the famous xine engine with VDR support."
arch=('i686' 'x86_64')
depends=('xine-lib' 'libexif' 'eject' 'libcdio' 'curl' 'libxinerama' 'gdk-pixbuf2')
privides=('oxine')
conflicts=('oxine')
makedepends=('pkgconfig')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/oxine/oxine-${pkgver}.tar.gz
	oxine_0.7.1_triangle.patch
	oxine1.patch)
url="http://oxine.sourceforge.net/"
md5sums=('2a2d05ee21892624e35cf539e532c0dd'
         '80f259f8d4b3f0e4ab00d6b784502f44'
         '46a3ce145554547bba46c015e627b442')

package() {
  cd ${startdir}/src/oxine-${pkgver}
  
  cat ../../oxine_0.7.1_triangle.patch | patch -p0
  patch -p1 < ../../oxine1.patch
  ./configure --prefix=/usr --enable-vdr --without-imagemagick
  make || return 1
  make DESTDIR=${pkgdir} install
}
