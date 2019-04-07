# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=unifydmin-git
pkgver=0.1.1.r2.g440665c
pkgrel=1
pkgdesc="Unified administration panel for heterogeneous Linux servers"
url="https://gitlab.com/gabmus/unifydmin"
arch=(any)
license=(GPL)
depends=(gtk3 fabric)
makedepends=(meson python)
provides=(unifydmin org.gabmus.unifydmin)
conflicts=(unifydmin)
source=("git+https://gitlab.com/gabmus/unifydmin.git")
sha256sums=(SKIP)

pkgver() {
    cd unifydmin
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson unifydmin build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
