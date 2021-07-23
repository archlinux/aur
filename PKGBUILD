pkgname=wlvncc-git
_pkgname=wlvncc
pkgver=r43.1ca82ce
pkgrel=1
pkgdesc='Wayland native VNC client'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/wlvncc
license=(custom:ISC)
depends=(aml-git libvncserver-git libxkbcommon pixman wayland)
makedepends=(git meson ninja gcc pkg-config wayland-protocols)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(wlvncc)
provides=(wlvncc=${pkgver%+*})

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson wlvncc build # --prefix /usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm 644 wlvncc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
