# Maintainer: sinbud2004 <sinbud2004@gmail.com>
pkgname=lambo-subtitle-edit
pkgver=1.0.0
pkgrel=1
pkgdesc="SRT subtitle editor with dual video preview"
arch=('x86_64')
url="https://github.com/Paul-sinbud2004/lambo-subtitle-edit"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
         'gst-plugins-ugly' 'gst-libav' 'hicolor-icon-theme'
         'xdg-desktop-portal' 'zenity')
makedepends=('rust' 'cargo')
source=("https://github.com/Paul-sinbud2004/lambo-subtitle-edit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.en.md "$pkgdir/usr/share/doc/$pkgname/README.en.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
