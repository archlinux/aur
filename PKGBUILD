# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxslt-git
pkgver=1.1.43.r3.g923903c5
pkgrel=1
pkgdesc="XML stylesheet transformation library"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
license=('MIT')
depends=('glibc' 'libgcrypt' 'libxml2')
makedepends=('git' 'cmake' 'python')
provides=("libxslt=$pkgver")
conflicts=('libxslt')
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxslt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxslt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "libxslt"

  #cmake --build "_build" --target test
}

package() {
  cd "libxslt"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "Copyright" -t "$pkgdir/usr/share/licenses/libxslt"
}
