# Contributor: NBonaparte, danwood76

pkgname=libhashab-git
_pkgname=libhashab
pkgver=r9.2a20780
pkgrel=1
pkgdesc="libgpod extension to talk with iPod nano 6th generation"
arch=("i686" "x86_64")
url="https://github.com/neheb/libhashab"
license=("unknown" "GPL")
depends=("libgpod")
makedepends=(git
lib32-{glibc,gcc-libs}) # rare deps for x64 pkg
source=("git+${url}.git" lib.patch)
sha256sums=('SKIP'
            '43e412a39f69b79f9cf1d94f69eb6c584d2564e4a976eb809fdb71dbdec324f6')

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
  install -D -m777 "libhashab64_original.so" "${pkgdir}/usr/lib/libgpod/libhashab.so"
  install -D -m777 "src/libhashab32_wrapper" "${pkgdir}/usr/lib/libgpod/libhashab32_wrapper"
  install -D -m777 "libhashab32.so" "${pkgdir}/usr/lib/libgpod/libhashab32.so"
}
