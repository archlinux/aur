# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-plugin-pack-svn
pkgver=2.1.2.svn.r11196
pkgrel=1
pkgdesc="Qmmp Plugin Pack. (SVN Version)"
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL')
depends=(
  'qmmp-svn' 'libqmmp.so'
  'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
  'glibc' # 'libc.so' 'libm.so'
  'qt6-base' # 'libQt6Core.so' 'libQt6Gui.so' 'libQt6Network.so' 'libQt6Widgets.so'
  'taglib' # 'libtag.so'
)
makedepends=(
  'subversion'
  'qt6-tools'
  'cmake'
  'yasm'
  'mpg123'
  'libxmp'
  'libsamplerate'
  'ffmpeg'
  'libmodplug'
)
optdepends=(
  'mpg123: alternative Mpeg-1-2-3 support'
  'libxmp: support for chiptune formats (Amiga, Atari, ..)'
  'libsamplerate: Sample Rate Conversion'
  'ffmpeg: ffmpeg engine support'
  'libmodplug: MOD input support'
)
provides=('qmmp-plugin-pack')
conflicts=('qmmp-plugin-pack')
source=('qmmp-plugin-pack::svn+http://svn.code.sf.net/p/qmmp-dev/code/branches/qmmp-plugin-pack-2.1/')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd qmmp-plugin-pack
  echo "$(cat qmmp-plugin-pack.pri | grep -m1 QMMP_PLUGIN_PACK_VERSION | cut -d ' ' -f3).svn.r$(svnversion)"
}

build() {
  cmake -S qmmp-plugin-pack -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_FFAP=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
