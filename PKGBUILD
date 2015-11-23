# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-screensavers-rsxs
_gitname=screensavers.rsxs
pkgver=20150907.3241d29
_gitver=3241d290917e99a3e88fca44e16d74c885a78b3d
pkgrel=1
pkgdesc='RSXS screensavers addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/notspiff/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
depends=('kodi-devel' 'libpng')
source=(
  "https://github.com/notspiff/$_gitname/archive/$_gitver.tar.gz"
  '0001-fix-gcc5-compile.patch'
  '0002-fix-default-include-dir.patch')
md5sums=(
  'SKIP'
  '3c0fc8c71c9ed7c76d4809a76b654283'
  'f32a6f97865027503a002f4dc72045b6')

_prefix='/usr'

build() {
  msg "Starting make..."

  cd "$srcdir/$_gitname-$_gitver"
  patch -p1 -i "$srcdir/0001-fix-gcc5-compile.patch"
  patch -p1 -i "$srcdir/0002-fix-default-include-dir.patch"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
