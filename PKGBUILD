# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-platform
_gitname=kodi-platform
pkgver=20150504.054a42f
_gitver=054a42f664af3a6740d49759c081d4929a190671
pkgrel=1
pkgdesc='Kodi platform environment for compiling cmake binary addons'
arch=('i686' 'x86_64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-libplatform')
depends=('kodi-devel' 'tinyxml')
raplaces=('kodi-platform-devel')
conflicts=('kodi-platform' 'kodi-platform-devel')
source=("https://github.com/xbmc/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR="$_prefix/lib" \
    -DCMAKE_INSTALL_LIBDIR_NOARCH="$_prefix/lib" \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
