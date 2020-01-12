# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=protothread
pkgname=libprotothread-git
pkgver=r47.3c1ed2e
pkgrel=1
_commit=3c1ed2e9ed5f937ee2eebf26a08d3383fe6488a1
pkgdesc="programming model that combines the advantages of event-driven programming and threaded programming"
arch=('i686' 'x86_64')
url="https://github.com/LarryRuane/protothread"
license=('APL2')
makedepends=('cmake' 'git')
conflicts=(libprotothread protothread)
provides=(libprotothread protothread)
source=("git+https://github.com/LarryRuane/${_pkgname}.git#commit=${_commit}")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
