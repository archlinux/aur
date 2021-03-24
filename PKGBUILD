# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=async++-git
pkgver=1.1.r0.g172ca3f
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
