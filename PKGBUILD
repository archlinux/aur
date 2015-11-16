# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-libplatform
_gitname=platform
pkgver=20150805.081032f
_gitver=081032fdb0daf16d443692c37e3ffc62732399ac
pkgrel=1
pkgdesc='Platform support library used by libCEC and binary add-ons for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
provides=('libplatform')
conflicts=('libplatform')
source=("https://github.com/Pulse-Eight/$_gitname/archive/$_gitver.tar.gz")
md5sums=('fd1b8bf3dd12d20e78e8da2b7988e86e')

_prefix='/usr'

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR="$_prefix/lib" \
    -DCMAKE_INSTALL_LIBDIR_NOARCH="$_prefix/lib" \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
