# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=async++-git
pkgver=r171.2c852e5
pkgrel=1
pkgdesc="Async++ is a lightweight concurrency framework for C++11."
arch=('any')
url='https://github.com/Amanieu/asyncplusplus'
license=('MIT')
depends=()
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}::git+https://github.com/Amanieu/asyncplusplus.git#branch=master")
sha1sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  mkdir -p build && pushd build
  cmake ..
  make
  popd
}

package() {
    cd "$srcdir/${pkgname}/build"
    make DESTDIR="$pkgdir" install 
}
 
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
