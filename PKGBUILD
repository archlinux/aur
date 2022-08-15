# Maintainer: Nikolay Bogoychev <nheart@gmail.com>

pkgname=translatelocally-git
pkgver=r484.4b965cd
pkgrel=1
pkgdesc='A fast privacy focused machine translation client that translates on your own machine.'
arch=('x86_64')
url='https://github.com/XapaJIaMnu/translateLocally'
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'pcre2' 'libarchive' 'protobuf')
makedepends=('git' 'cmake' 'qt6-tools' 'clang' 'make' 'binutils' 'intel-oneapi-mkl')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd translateLocally
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # No tags, do this when we have tags
  # git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd translateLocally
  mkdir -p build
  cd build
  CC=clang CXX=clang++ cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd translateLocally/build
  install -Dm644 ../LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  make DESTDIR="$pkgdir" install
}
