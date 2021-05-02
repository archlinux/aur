# Maintainer: chn <g897331845@gmail.com>

pkgname=libcuckoo
pkgver=0.3
pkgrel=1
pkgdesc="A high-performance, concurrent hash table"
arch=('any')
url='https://github.com/efficient/libcuckoo'
license=('Apache License, Version 2.0')
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/efficient/libcuckoo/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('13f68f7d20c8b9d819d6f1b12a3b1dc4')

build() {
    cd "${srcdir}/libcuckoo-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev ..
    make
}

package() {
    cd "${srcdir}/libcuckoo-${pkgver}/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "${srcdir}/libcuckoo-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
