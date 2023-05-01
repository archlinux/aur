# Maintainer: Clément Martinez <me at moverest dot xyz>
pkgname=wl-kbptr
pkgver=0.1.0
pkgrel=1
url="https://github.com/moverest/wl-kbptr"
pkgdesc="Control the mouse pointer with the keyboard on Wayland"
arch=('x86_64')
license=('GPL-3.0')
depends=('cairo' 'wayland' 'libxkbcommon')
makedepends=('meson' 'wayland-protocols')
source=("https://github.com/moverest/wl-kbptr/archive/v$pkgver.tar.gz")
sha256sums=('ff0693a300fda6aae195c1ad12d755d4f2b8cb00f4e42a9bbd9177f47a0d28ad')

build() {
    arch-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    cd "$pkgname-$pkgver"
    install -Dm 0644 LICENSE -t "$pkgdir/usr/share/licenses/wl-kbptr/"
    install -Dm 0644 README.md -t "$pkgdir/usr/share/doc/wl-kbptr/"
}
