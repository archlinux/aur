# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.0rc5.r36.g24ae978
pkgrel=2
pkgdesc='A library that can be used to add the RIST protocol to applications (git version)'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('git' 'meson' 'cmake' 'cmocka' 'lz4')
provides=('librist')
conflicts=('librist')
BUILDENV=('!check')
source=('git+https://code.videolan.org/rist/librist.git')
sha256sums=('SKIP')

pkgver() {
    git -C librist describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

build() {
    arch-meson build librist
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
    install -D -m644 librist/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
