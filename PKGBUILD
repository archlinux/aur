pkgname=libhashab-git
_pkgname=libhashab
pkgver=r9.2a20780
pkgrel=1
pkgdesc="libgpod extension to make it talk to iPod nano 6th generation"
arch=("i686" "x86_64")
url="https://github.com/neheb/libhashab"
license=("unknown" "GPL")
depends=("libgpod")
makedepends=("git")
source=("git://github.com/neheb/libhashab.git"
        "lib.patch")
md5sums=("SKIP"
         "7d5be1e8b685cd1e1c645da5c7c2ffe4")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  patch -p1 -i "$srcdir/lib.patch"
  cd src
  make
}

package() {
  cd $_pkgname
  install -D -m777 "src/libhashab.so" "${pkgdir}/usr/lib/libgpod/libhashab.so"
  install -D -m777 "src/libhashab32_wrapper" "${pkgdir}/usr/lib/libgpod/libhashab32_wrapper"
  install -D -m777 "libhashab32.so" "${pkgdir}/usr/lib/libgpod/libhashab32.so"
}
