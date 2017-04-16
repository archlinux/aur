# Maintainer: Stefan Brand <package@seiichiro0185.org>
pkgname=libtbtfwu-git
pkgver=r13.1797ab5
pkgrel=1
pkgdesc="NVM Controller Firmware Update Library from the Intel Thunderbolt Software Userspace"
arch=('x86_64')
url="https://github.com/01org/thunderbolt-software-user-space"
license=('BSD')
depends=('dbus-c++')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('libtbtfwu::git+https://github.com/01org/thunderbolt-software-user-space.git#branch=fwupdate')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  cmake ../fwupdate/libtbtfwu -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
