# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=asplib
pkgver=20150502.490de46
_gitver=490de460e856acd1ae2feb7f8111f137e40aa0d0
pkgrel=2
pkgdesc='Basic Audio DSP Processor addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/AchimTuran/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("https://github.com/AchimTuran/$pkgname/archive/$_gitver.tar.gz"
        "0001-CMakeLists.txt-fix-compilation-on-linux.patch"
        "0002-CMakelist.txt-add-missing-files-and-install-headers.patch")
md5sums=('SKIP' 'SKIP' 'SKIP')

_prefix='/usr'

prepare() {
  cd "$srcdir/$pkgname-$_gitver"
  patch -p1 -i "${srcdir}/0001-CMakeLists.txt-fix-compilation-on-linux.patch"
  patch -p1 -i "${srcdir}/0002-CMakelist.txt-add-missing-files-and-install-headers.patch"
}

build() {
  cd "$srcdir/$pkgname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR=lib \
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
