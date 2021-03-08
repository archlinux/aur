# Maintainer: Martin

pkgname=kde1-kgoldrunner-git
pkgver=1.r12.1f4800f
pkgrel=1
pkgdesc="Historical copy of kgoldrunner for KDE 1, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://invent.kde.org/sandsmark/kde1-kgoldrunner"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-kgoldrunner)
conflicts=(kde1-kgoldrunner)

source=("git+https://invent.kde.org/sandsmark/kde1-kgoldrunner.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-kgoldrunner
  printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  cmake "$srcdir"/kde1-kgoldrunner -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
