# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard-git
pkgver=r1660.40b3172
pkgrel=1
pkgdesc="Basic keyboard, blazing the path of modern Wayland keyboards"
url="https://source.puri.sm/Librem5/squeekboard"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('gtk3' 'wayland' 'gnome-desktop')
optdepends=('feedbackd: haptic feedback')
makedepends=(git
             pkg-config
             meson
             intltool
             rust
             feedbackd
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
