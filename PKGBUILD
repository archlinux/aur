# Maintainer: Martin

pkgname=kde1-kcmlaptop-git
pkgver=1.1.2r12.7afd21d
pkgrel=1
pkgdesc="Historical copy of laptop support for KDE 1, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kcmlaptop"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-kde${_module})
conflicts=(kde1-kde${_module})

# Mirror
source=("git+https://github.com/sandsmark/kcmlaptop.git")

md5sums=('SKIP')

pkgver() {
  cd kcmlaptop
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
  cmake "$srcdir"/kcmlaptop -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kcmlaptop
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
