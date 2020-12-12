# Maintainer: Tin Lai <oscar@tinyiu.com>
pkgname=xps-home-end-keymappings-git
_pkgname=xps-home-end-keymappings
pkgver=r23.b868650
pkgrel=1
pkgdesc="xps-home-end-keymappings: make xps's amazing keymapping works in other keyboard"
arch=('x86_64')
license=('GPL3')
url="https://github.com/soraxas/xps-home-end-keymappings"
depends=('libevdev')
makedepends=('gcc')
source=("$_pkgname::git+https://github.com/soraxas/xps-home-end-keymappings.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
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
