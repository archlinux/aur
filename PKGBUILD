# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-audiodecoder-sidplay
_gitname=audiodecoder.sidplay
pkgver=20150602.27b2c05
_gitver=27b2c0582878857bfe03195471fa7ffa4bcc40f0
pkgrel=1
pkgdesc='Sidplay decoder addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/notspiff/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel' 'sidplay-libs')
source=("https://github.com/notspiff/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  msg "Starting make..."
  cd "$srcdir/$_gitname-$_gitver"
}

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DSIDPLAY2_LIBRARIES="/usr/lib/libsidplay2.so" \
    -DSIDPLAY2_INCLUDE_DIRS="$_prefix/include/sidplay" \
    -DCMAKE_INCLUDE_PATH="$_prefix/include" \
    -DCMAKE_LIBRARY_PATH="$_prefix/lib" \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
