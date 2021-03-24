# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=libcuckoo-git
pkgver=0.3.r0.g8785773
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
    cmake \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C "${pkgname}/build" all
}

package() {
    make -C "${pkgname}/build" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
pkgver() {
  git -C ${pkgname} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
