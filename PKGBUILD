# Maintainer: Martin

pkgname=kde1-kpackage-git
pkgver=1.1.2r32.52a00e9
pkgrel=1
pkgdesc="Package management GUI for KDE 1 with pacman/alpm support. Almost usable."
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde1-kpackage"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdebase)
makedepends=(cmake git)
provides=(kde1-kpackage)
conflicts=(kde1-kpackage)

source=("git+https://invent.kde.org/sandsmark/kde1-kpackage.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-kpackage
  printf "1.1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake "$srcdir"/kde1-kpackage -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
