# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.8.0
pkgrel=1
pkgdesc="A batteries-included screenshot tool for wlroots-compatible Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/Mabi19/spaceshot"
license=('MIT')
depends=(
    'glibc'
    'glib2'
    'cairo'
    'libpng'
    'pango'
    'libxkbcommon'
    'wayland'
    'xxhash'
    'libglvnd'
    'dbus'
)
makedepends=(
    'meson'
    'python'
    'pkg-config'
    'wayland-protocols'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('59b69b6b51edf30578a9bb9514c0d6627cce5a5cf7eea2ef79d5f2b20a8921f18522696ebbb64edb8b36d13552976e62a4d412d19690391ab9741989b7fd0def')

build() {
    export CFLAGS="$CFLAGS -fvisibility=hidden"

    rm -rf build
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    cd "$pkgname-$pkgver"
    install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
