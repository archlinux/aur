# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.9.0
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('libsub>=1.1.13' 'libcxml>=0.15.1' 'libdcp>=1.3.4' 'ffmpeg' 'glib2' 'imagemagick' 'libssh' 'wxgtk>=3.0.1' 'libquickmail>=0.1.19' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm')
makedepends=('python2' 'boost>=1.60.0' )
source=("http://dcpomatic.com/downloads/${pkgver}/${pkgname}-${pkgver}.tar.bz2" )
sha256sums=('4596bb660e5339c6a633ceb40656d2787405ad91b706080335b1b466e17f920d')






build() {
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
  CXXFLAGS="$CXXFLAGS    -std=c++11 -O2 "

  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure   --prefix=/usr 
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64  ]
  then
      mv usr/lib64 usr/lib
  fi
}

