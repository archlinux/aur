# Maintainer: Martin

pkgname=kde1-amor-git
pkgver=0.5r9.ce19b63
pkgrel=1
pkgdesc="KDE1 version of Amor, with extra themes (only works with the KDE1 window manager"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde1-amor"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-amor)
conflicts=(kde1-amor)

source=("git+https://github.com/sandsmark/kde1-amor.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-amor
  printf "0.5r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  cmake "$srcdir"/kde1-amor -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
