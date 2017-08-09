# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=libminigbm-git
pkgver=r182.4df286c
pkgrel=1
pkgdesc="The Chromium OS shell for Linux"
arch=('x86_64')
url="https://www.chromium.org/chromium-os"
license=('GPL')
provides=('libminigbm')
source=("git+https://chromium.googlesource.com/chromiumos/platform/minigbm"
        "minigbm.patch")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd minigbm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd minigbm
    patch -Np1 -i "${srcdir}/minigbm.patch"
}

build() {
    cd minigbm
    make
}

package() {
    install -dm 755 "${pkgdir}/usr/lib"
    install -m 755 "minigbm/libminigbm.so.1.0.0" "${pkgdir}/usr/lib/libminigbm.so"
}
