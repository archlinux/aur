# Maintainer: zan <zan@420blaze.it>

pkgname=kwayland-server-git
_name=${pkgname%-git}
pkgver=v5.19.1.r65.g8351f51
pkgrel=1
pkgdesc='Wayland Server Components built on KDE Frameworks '
arch=(x86_64)
url='https://invent.kde.org/plasma/kwayland-server'
license=(LGPL)
depends=(qt5-base)
makedepends=(git extra-cmake-modules-git plasma-wayland-protocols wayland-protocols kwayland doxygen qt5-tools)
conflicts=(kwayland-server)
provides=(kwayland-server)
groups=(plasma)
source=("git+https://invent.kde.org/plasma/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}




