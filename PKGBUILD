# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=libminigbm-git
pkgver=latest
pkgrel=1
pkgdesc="Generic Buffer Management (GBM) implementation used in Chromium OS"
arch=('x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/minigbm/"
license=('https://chromium.googlesource.com/chromiumos/platform/minigbm/+/master/LICENSE')
provides=('libminigbm')
source=("git+https://chromium.googlesource.com/chromiumos/platform/minigbm"
        "minigbm.patch")
sha256sums=('SKIP'
            'a347ca3e125e42cf1dd9e19ca058c3569ee7d88eb1592534d30a2fa130400d1e')

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
