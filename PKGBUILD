# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-audioencoder-lame
_gitname=audioencoder.lame
pkgver=20150601.b283cd5
_gitver=b283cd50cd2f89b7fd7b903c957a6a993e3756d2
pkgrel=1
pkgdesc='Lame MP3 encoder addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
depends=('kodi-devel' 'lame')
conflicts=('kodi-audioencoder-lame-devel')
replaces=('kodi-audioencoder-lame-devel')
source=("https://github.com/xbmc/$_gitname/archive/$_gitver.tar.gz")
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
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
