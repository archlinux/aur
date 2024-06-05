# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=sysrepo
pkgver=2.2.170
pkgrel=1
pkgdesc='YANG-based configuration and operational state data store for Unix/Linux applications'
depends=('libyang' 'protobuf-c' 'libev' 'libssh')
makedepends=('gcc' 'make' 'cmake' 'pkgconf' 'doxygen')
arch=('x86_64' 'i686')
url='http://www.sysrepo.org/'
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysrepo/sysrepo/archive/v$pkgver.tar.gz")
sha256sums=('02ffd961e0128ee9d22076c42a0a6ae47ae69ed4f2f552d4f1372fa963c006d1')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir "build"
}

build() {
    cd "$pkgname-$pkgver/build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}"/usr/include/{values,xpath}.h
    install -Dm0644 ../LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set sw=4 ts=4 et:
