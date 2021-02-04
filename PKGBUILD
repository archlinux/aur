# Maintainer: Martin

pkgname=kde1-ktip-git
pkgver=1.1.2r19.a4403ee
pkgrel=1
pkgdesc="Backport of ktip to KDE 1, with Kandalf and tips replaced by fortunes"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde1-ktip"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-ktip)
conflicts=(kde1-ktip)

source=("git+https://invent.kde.org/sandsmark/kde1-ktip.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-ktip
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
  cmake "$srcdir"/kde1-ktip -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
