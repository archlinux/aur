# Maintainer: Clément Martinez <me at moverest dot xyz>
pkgname=sway-resize
pkgver=0.1.0
pkgrel=1
url="https://github.com/moverest/sway-resize"
pkgdesc="Resize windows visually on Sway"
arch=('x86_64')
license=('GPL-3.0')
depends=('cairo' 'wayland' 'libxkbcommon' 'jansson')
makedepends=('meson' 'wayland-protocols')
source=("https://github.com/moverest/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5222a40a5ff7bcd37546f4825b87970ed4654aabaf15a7dd4f15df6be78efe6a')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    cd "$pkgname-$pkgver"
    install -Dm 0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
