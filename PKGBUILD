# Maintainer Zan <zan@420blaze.it>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-pg-qt-git
_name=${pkgname%-git}
pkgver=r665.268c40b
pkgrel=1
pkgdesc="KDevelop Parser Generator, a LL(1) parser generator used by KDevelop language plugins. (GIT version)"
arch=(x86_64)
url='http://www.kdevelop.org'
license=(GPL)
depends=(qt5-base)
conflicts=(kdevelop-pg-qt)
makedepends=(git extra-cmake-modules)
source=("git+https://invent.kde.org/kdevelop/$_name.git")
sha1sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
