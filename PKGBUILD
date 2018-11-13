# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=libcuckoo-git
pkgver=r364.86d5ef0
pkgrel=1
pkgdesc="libcuckoo provides a high-performance, compact hash table that allows multiple concurrent reader and writer threads."
arch=('any')
url='https://github.com/efficient/libcuckoo'
license=('Apache License, Version 2.0')
depends=()
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}::git+https://github.com/efficient/libcuckoo.git#branch=master")
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
