# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.6.1
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
sha512sums=('c4a98238646623fc9f70cd06d3992d74f3aaccb1f20a212d3cf199c120b8e22b5bb4cc99f68448451dc74d9b9cc77f074217e5412b0881ed751a34799aede9d2')

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
