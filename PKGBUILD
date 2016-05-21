# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=redox
pkgver=0.3
pkgrel=1
pkgdesc='Redis library for C++11'
arch=('x86_64' 'i686')
url='https://github.com/hmartiro/redox'
license=('APACHE')
makedepends=('git' 'hiredis' 'libev' 'cmake' 'ninja')
depends=('hiredis' 'libev' 'gcc-libs')
source=("git://github.com/hmartiro/redox#commit=74bf7b4977")
md5sums=('SKIP')

prepare() {
  # Use /usr/lib instead of /usr/lib64.
  # Setting LIB_PREFIX to nothing does not work.
  sed 's/64//g' -i "$pkgname/CMakeLists.txt"
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C "$pkgname/build" install
}


# vim:set ts=2 sw=2 et:
