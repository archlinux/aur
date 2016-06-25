# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-plugin-pack-svn
pkgver=1.1.1.svn.r6521
pkgrel=1
pkgdesc="Qmmp Plugin Pack. (SVN Version)"
arch=('i686' 'x86_64')
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
             )
optdepends=('mpg123: alternative Mpeg-1-2-3 support'
            'taglib: Mpeg-1-2-3 tag support'
            'libxmp: support for chiptune formats (Amiga, Atari, ..)'
            'libsamplerate: Sample Rate Conversion'
            )
provides=('qmmp-plugin-pack')
conflicts=('qmmp-plugin-pack')
source=('qmmp-plugin-pack::svn+svn://svn.code.sf.net/p/qmmp-dev/code/branches/qmmp-plugin-pack-1.2')
sha1sums=('SKIP')

pkgver() {
  cd qmmp-plugin-pack
  echo "$(cat qmmp-plugin-pack.pri | grep QMMP_PLUGIN_PACK_VERSION | cut -d ' ' -f3).svn.r$(svnversion)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qmmp-plugin-pack \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_DIR=lib \
    -DUSE_FFAP=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
