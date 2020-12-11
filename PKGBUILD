# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=xps-home-end-keymappings-git
_pkgname=xps-home-end-keymappings
pkgver=1.0.0
pkgrel=3
pkgdesc="xps-home-end-keymappings: make xps's amazing keymapping works in other keyboard"
arch=('x86_64')
license=('GPL3')
url="https://github.com/soraxas/xps-home-end-keymappings"
depends=('libevdev')
makedepends=('gcc')
source=("$_pkgname::git+https://github.com/soraxas/xps-home-end-keymappings.git")
md5sums=("SKIP")

build() {
    # gcc xps-home-end-keymappings.c -o xps-home-end-keymappings -I/usr/include/libevdev-1.0 -levdev -ludev
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -m 755 "src/xps-keymapping" "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "src/xps-keymapping.service" "${pkgdir}/usr/lib/systemd/system"
}
