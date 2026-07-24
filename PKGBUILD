# Maintainer: FrogSnot
pkgname=sunder
pkgver=1.4.8
pkgrel=1
pkgdesc="A desktop YouTube music client that doesn't spy on you"
arch=('x86_64')
url="https://github.com/FrogSnot/Sunder"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite' 'yt-dlp' 'ffmpeg')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e70211a276b4aef4952760e2f398c9d6728137a458be5153fc7cd2342075724d')

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
