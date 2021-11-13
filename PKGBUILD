# Maintainer: willemw <willemw12@gmail.com>

pkgname=ngp-git
pkgver=1.3.r201.gc15dc44
pkgrel=1
pkgdesc="Ncurses grep tool"
arch=('x86_64')
url="https://github.com/jonathanklee/ngp"
license=('GPL')
makedepends=('cmake' 'git' 'libconfig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  CFLAGS="$CFLAGS -Wno-error=stringop-truncation"

  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

