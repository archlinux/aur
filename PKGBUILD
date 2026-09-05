# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.7.0
pkgrel=3
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
sha512sums=('b399d1f64403dfb5bd1dc084a63471c1e19c7c5c14b868e0122bf44d9e788cf8200b0fe0b2e7d1a10f61c301a6d25b94d89bdfe841b0fa0a9fa60d780f7f3018')

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
