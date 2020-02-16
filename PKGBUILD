# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='Library to create Wayland desktop components using the Layer Shell protocol'
pkgname=gtk-layer-shell
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
license=(MIT)
depends=(
    "gtk3"
    "wayland"
)
makedepends=(
    "gtk-doc"
    "gobject-introspection"
    "meson"
    "ninja"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wmww/gtk-layer-shell/archive/v$pkgver.tar.gz")
sha512sums=('813ae86939d4bb300e78197a09fe7e4ccda9e2e6c008b72fa45d0a5be311ade1762af31835d3e7fea00f49a438f7ad37d3e57c84e0a2ebbbf58e807048c072da')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix=/usr \
        --wrap-mode=nofallback \
        --buildtype=plain \
        -Ddocs=true \
        build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
