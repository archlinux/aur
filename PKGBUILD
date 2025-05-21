# Maintainer: Jack Mahoney <jacksmahoney@gmail.com>
# Contributor: Anton Dmitriev <contact.admtrv@gmail.com>

pkgname=objcurses
pkgver=1.3.0
pkgrel=1
pkgdesc="Minimalistic 3D object viewer for the terminal using ncurses"
arch=('x86_64' 'i686')
url="https://github.com/admtrv/objcurses"
license=('MIT')
depends=('ncurses' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'cmake-install.patch')
sha256sums=('e5458e5ddb7366f36290dd7a270e45a06c93c3197035662e090f10567fa5c484'
            '69a17811a0cf709df33bb047fa3e27fed8801cc6d83b811793449cf81822b312')

# hack to add cmake install rules until PR passes
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../cmake-install.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None

  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  DESTDIR="$pkgdir/" cmake --install build
}

# vim:set ts=2 sw=2 et:
