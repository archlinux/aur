# Maintainer: Thiago Vicente <thiagoaureliovicente@gmail.com>
pkgname=fogwall
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-lightweight procedural fog live wallpaper for wlroots-style Wayland compositors, reactive to Spotify/MPRIS"
arch=('x86_64')
url="https://github.com/ThiagoAVicente/fogwall"
license=('MIT')
depends=('wayland' 'libglvnd')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=(
    'pipewire: Spotify loudness reactivity and beat-sync'
    'dbus: MPRIS album-art tint sync'
    'curl: fetch remote (https://) album art for tint sync'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('163653ebbaf21b07659f17610e77900ff2d0aa05dd460d7cdec1ffdfa9622fa8')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build -Db_lto=true
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
