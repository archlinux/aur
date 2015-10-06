# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.4.0
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('libsub>=1.1.6' 'libcxml>=0.13.0' 'libdcp>=1.2.6' 'ffmpeg' 'glib2' 'imagemagick' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2' 'libssh' 'wxgtk>=3.0.1' 'libquickmail>=0.1.19' 'libzip' 'xz' 'libsndfile')
makedepends=('python2' 'boost>=1.45' )
source=("http://dcpomatic.com/downloads/${pkgver}/${pkgname}-${pkgver}.tar.bz2" )
sha256sums=('a3780ea8ff4d2a3235cd5043b0e0ef6a95bb98f5f5d12e8e9c617062320e036b')






build() {
  CXXFLAGS="$CXXFLAGS -I/usr/include/openjpeg-1.5/ "
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
