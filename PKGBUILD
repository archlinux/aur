# Maintainer: Martin

pkgname=kde1-kdewizard-git
pkgver=1.1.2r5.b4d33ce
pkgrel=1
pkgdesc="Historical copy of kdewizard for KDE 1, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kdewizard"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-kdewizard)
conflicts=(kde1-kdewizard)

# Mirror
source=("git+https://github.com/sandsmark/kdewizard.git")

md5sums=('SKIP')

pkgver() {
  cd kdewizard
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
  cmake "$srcdir"/kdewizard -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
