# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.6
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
    'dbus'
)
makedepends=(
    'meson'
    'python'
    'pkg-config'
    'vala'
    'wayland-protocols'
    'wlr-protocols'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6d970c89db15050c4fdf8856a273ab833093f07657cf99066ba5041bdcceae959f1648adf45eff6e36a553af047ceb06cc9510bef3e168fbf8929a2c288f54a4')

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
