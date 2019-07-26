# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard-git
pkgver=r918.d8f48cc
pkgrel=1
pkgdesc="Basic keyboard, blazing the path of modern Wayland keyboards"
url="https://source.puri.sm/Librem5/squeekboard"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=('gtk3' 'libcanberra' 'wayland' 'libcroco')
makedepends=(git
             pkg-config
             meson
             intltool
             gtk-doc)
provides=(squeekboard)
conflicts=(squeekboard)
source=("git+https://source.puri.sm/Librem5/squeekboard.git")
sha256sums=("SKIP")

pkgver() {
    cd squeekboard
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson squeekboard build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
