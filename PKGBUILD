# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.5
pkgrel=2
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
sha512sums=('1f32f80059576914789b002d382eceb35530d2b7d6bb855425d7e30255f545dbd24ad292ea507ca9fbb2576b7371d67488a8f91007174a6a6ab2f06e959dc3fe')

build()
{
    export CFLAGS="$CFLAGS -fvisibility=hidden"

    rm -rf build
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package()
{
    meson install -C build --destdir "$pkgdir"

    cd "$pkgname-$pkgver"
    install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
