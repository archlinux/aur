# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.14.47
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
depends=('pangomm>=1.4' 'xorgproto' 'libsub>=1.4.24' 'libcxml>=0.16.1' 'libdcp>=1.6.17' 'ffmpeg>=4.0.2' 'glib2' 'imagemagick' 'libssh'  'wxgtk2>=3.0.4'   'wxgtk-common' 'libquickmail>=0.1.29' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264')
makedepends=('python2' 'boost>=1.72.0' )
source=("${pkgname}-${pkgver}.tar.bz2::https://dcpomatic.com/dl.php?id=source&version=${pkgver}" )
sha256sums=('81c5733655ed640204e736fc5419e98de8ba6e514bf51c722ea40f1057963ed9')

build() {
  PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
  CXXFLAGS="$CXXFLAGS    -std=c++11 -O2 "

  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure   --prefix=/usr --disable-tests
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
