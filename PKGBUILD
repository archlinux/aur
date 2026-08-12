_pkgname=Linn
pkgname=linn
pkgver=1.2.1
pkgrel=1
pkgdesc="GTK4 NetEase Cloud Music client built with Rust and Relm4"
arch=('x86_64')
url="https://github.com/ljyh223/linn"
license=('GPL-3.0-or-later')
depends=(
    'libadwaita'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-libav'
    'gstreamer'
)
optdepends=(
    'gst-plugins-bad: extra media codecs'
    'gst-plugins-ugly: extra media codecs'
)
makedepends=('cargo' 'meson')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
build() {
    cd "$_pkgname-$pkgver"
    cargo build --release
    arch-meson . build
    meson compile -C build
}
package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 target/release/linn "$pkgdir/usr/bin/linn"
    meson install -C build --destdir "$pkgdir"
}