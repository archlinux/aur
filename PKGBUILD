# Maintainer: Martin

pkgname=kde1-kteatime-git
pkgver=1.r3.f467233
pkgrel=1
pkgdesc="Historical copy of kteatime for KDE 1, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde1-kteatime"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-kteatime)
conflicts=(kde1-kteatime)

source=("git+https://invent.kde.org/sandsmark/kde1-kteatime.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-kteatime
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
  cmake "$srcdir"/kde1-kteatime -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
