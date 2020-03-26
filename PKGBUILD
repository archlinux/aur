# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-plugin-pack-svn
pkgver=1.4.0.svn.r9311
pkgrel=1
pkgdesc="Qmmp Plugin Pack. (SVN Version)"
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL')
depends=('qmmp-svn')
makedepends=('subversion'
             'cmake'
             'yasm'
             'mpg123'
             'libxmp'
             'libsamplerate'
             'taglib'
             'libavutil.so'
             'libavcodec.so'
             'libswscale.so'
             'libavformat.so'
             'libswresample.so'
             )
optdepends=('mpg123: alternative Mpeg-1-2-3 support'
            'taglib: Mpeg-1-2-3 tag support'
            'libxmp: support for chiptune formats (Amiga, Atari, ..)'
            'libsamplerate: Sample Rate Conversion'
            'ffmpeg: ffmpeg engine support'
            )
provides=('qmmp-plugin-pack')
conflicts=('qmmp-plugin-pack')
source=('qmmp-plugin-pack::svn+svn://svn.code.sf.net/p/qmmp-dev/code/trunk/qmmp-plugin-pack/')
sha1sums=('SKIP')

pkgver() {
  cd qmmp-plugin-pack
  echo "$(cat qmmp-plugin-pack.pri | grep -m1 QMMP_PLUGIN_PACK_VERSION | cut -d ' ' -f3).svn.r$(svnversion)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qmmp-plugin-pack \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_FFAP=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
