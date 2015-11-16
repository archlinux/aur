# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=asplib
pkgver=20151025.df5c386
_gitver=df5c386d122c8fcd3e405ef93076e81ba9638772
pkgrel=2
pkgdesc='a small and lightweight C++ library for digital signal processing'
arch=('i686' 'x86_64')
url="https://github.com/AchimTuran/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("https://github.com/AchimTuran/$pkgname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  cd "$srcdir/$pkgname-$_gitver"
}

build() {
  cd "$srcdir/$pkgname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$pkgname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
