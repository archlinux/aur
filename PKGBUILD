# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>

pkgname=phoc-git
pkgver=r118.d8375ab
pkgrel=1
pkgdesc="Wayland compositor for phones"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=('libcap' 'systemd' 'wayland' 'opengl-driver' 'libxcb'
         'xcb-util-errors' 'xcb-util-image' 'xcb-util-wm' 'pixman'
         'libinput' 'libxkbcommon' 'libpng' 'ffmpeg' 'glib2')
makedepends=('meson' 'ninja' 'git' 'wayland-protocols' 'ctags')
provides=(phoc)
conflicts=(phoc)
source=("git+https://source.puri.sm/Librem5/phoc.git")
sha256sums=("SKIP")

pkgver() {
    cd phoc
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson phoc build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
