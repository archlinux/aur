# Maintainer: FrogSnot
pkgname=sunder
pkgver=1.2.6
pkgrel=1
pkgdesc="A desktop YouTube music client that doesn't spy on you"
arch=('x86_64')
url="https://github.com/FrogSnot/Sunder"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite' 'yt-dlp' 'ffmpeg')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('897e2d1dcf1dca490632a7f895f61cc7a3a8c71e3512f485214d658b71b7aeaf')

build() {
    cd "$srcdir/Sunder-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    npm install
    npx tauri build --no-bundle
}

package() {
    cd "$srcdir/Sunder-$pkgver"

    install -Dm755 "src-tauri/target/release/sunder" "$pkgdir/usr/bin/sunder"

    install -Dm644 "sunder.desktop" "$pkgdir/usr/share/applications/sunder.desktop"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/sunder.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
