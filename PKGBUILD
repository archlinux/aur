# Maintainer: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4'
pkgname=gtk4-layer-shell
pkgver=1.0.0
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/wmww/gtk4-layer-shell"
depends=(
    "gtk4"
    "wayland"
)
makedepends=(
    "gtk-doc"
    "gobject-introspection"
    "meson"
    "ninja"
    "valabind"
    "python"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('89d25ca0a7c2db7795c6bfb46e7d504ee71f005b3ea8580c8e9e35b57027be92')

build() {
    meson --prefix=/usr \
          --wrap-mode=nofallback \
          --buildtype=plain \
          -Dtests=true \
          -Ddocs=true \
          -Dintrospection=true \
          -Dvapi=true \
          -Dexamples=true \
          "$pkgname-$pkgver" \
          build
    ninja -C build
}

# See: https://github.com/wmww/gtk4-layer-shell/issues/12
# check() {
# ninja -C build test
# }

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
