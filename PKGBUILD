# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libndi-git
pkgver=r14.gb2297ff
pkgrel=1
pkgdesc='Library to interact with Network Device Interface (NDI) streams (git version)'
arch=('x86_64')
url='https://code.videolan.org/jbk/libndi/'
license=('LGPL')
depends=('ffmpeg' 'libmicrodns')
makedepends=('git' 'meson')
provides=('libndi')
conflicts=('libndi')
source=('git+https://code.videolan.org/jbk/libndi.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.g%s' "$(git -C libndi rev-list --count HEAD)" "$(git -C libndi rev-parse --short HEAD)"
}

build() {
    arch-meson build libndi
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
}
