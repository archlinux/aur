# Maintainer: Martin

pkgname=ktamaga-git
pkgver=0.6.2r17.73d8d74
pkgrel=1
pkgdesc="A Tamagotchi emulator (you know, that silly LCD game from Ban Dai)"
arch=(i686 x86_64)
url="https://github.com/sandsmark/ktamaga"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-ktamaga ktamaga)
conflicts=(kde1-ktamaga ktamaga)

source=("git+https://github.com/sandsmark/ktamaga.git")

md5sums=('SKIP')

pkgver() {
  cd ktamaga
  printf "0.6.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  cmake "$srcdir"/ktamaga -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
