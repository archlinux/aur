# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-libplatform
_gitname=platform
pkgver=1.0.9
pkgrel=1
pkgdesc='Platform support library used by libCEC and binary add-ons for Kodi'
arch=('i686' 'x86_64')
url="http://www.kodi.tv"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
source=("http://mirrors.xbmc.org/build-deps/sources/$_gitname-$pkgver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  cd "$srcdir/$_gitname-$pkgver"
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
  cd "$srcdir/$_gitname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
