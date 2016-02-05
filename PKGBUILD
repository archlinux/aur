# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.6.18
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('libsub' 'libcxml>=0.15.0' 'libdcp' 'ffmpeg' 'glib2' 'imagemagick' 'openjpeg>=1.5.0' 'openjpeg<=1.5.2' 'libssh' 'wxgtk>=3.0.1' 'libquickmail>=0.1.19' 'libzip' 'xz' 'libsndfile')
makedepends=('python2' 'boost>=1.45' )
source=("http://dcpomatic.com/downloads/${pkgver}/${pkgname}-${pkgver}.tar.bz2" )
sha256sums=('0386abf916b2e84d61b6f47533b2c6550690b4cb7a98febf78296a6e48f02553')






build() {
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
  CXXFLAGS="$CXXFLAGS    -std=c++11"

  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure   --prefix=/usr --static-ffmpeg
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}
