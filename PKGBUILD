# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-string-git
pkgver=r45.c6f1f51
pkgrel=1
pkgdesc='Standalone library for unicode aware string support (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('git' 'cmake')
provides=('cs-string')
conflicts=('cs-string')
source=('git+https://github.com/copperspice/cs_string.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C cs_string rev-list --count HEAD)" "$(git -C cs_string rev-parse --short HEAD)"
}

build() {
    cmake -B build -S cs_string \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

check() {
    build/bin/Test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 cs_string/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
