# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=sysrepo
pkgver=1.4.70
pkgrel=1
pkgdesc='YANG-based configuration and operational state data store for Unix/Linux applications'
depends=('libyang' 'protobuf-c' 'libev' 'libssh')
optdepends=('python: for python 3 bindings')
makedepends=('gcc' 'make' 'cmake' 'pkgconf' 'doxygen' 'swig' 'python')
arch=('x86_64' 'i686')
url='http://www.sysrepo.org/'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysrepo/sysrepo/archive/v$pkgver.tar.gz")
sha256sums=('f0f894d4ed98ce9d20fda219378b844731d796e95115c07f4c067d853e20ca36')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir "build"
}

build() {
    cd "$pkgname-$pkgver/build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGEN_LANGUAGE_BINDINGS=ON \
        ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
