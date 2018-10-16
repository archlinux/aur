# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=virtboard-git
pkgver=r6272.5210414c
pkgrel=1
pkgdesc="A basic keyboard, blazing the path of modern Wayland keyboards. Sacrificial."
url="https://source.puri.sm/Librem5/virtboard"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=()
makedepends=(git
             pkg-config
             meson)
provides=(virtboard)
conflicts=(virtboard)
source=("git+https://source.puri.sm/Librem5/virtboard.git")
sha256sums=("SKIP")

pkgver() {
    cd virtboard
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf build
    arch-meson virtboard build -Dtests=false
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
