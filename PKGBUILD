# Maintainer: Eden Tyler-Moss <eden@etylermoss.com>

pkgname=youtube-tv-desktop-app
pkgver=1.0.4
pkgrel=2
pkgdesc="Youtube for TV Desktop app"
arch=('x86_64')
url="https://github.com/etylermoss/youtube-tv-desktop"
license=('GPL3')
depends=('electron')
makedepends=('nodejs' 'npm')
provides=('youtube-tv-desktop-app')
source=(
    "https://github.com/etylermoss/youtube-tv-desktop/archive/v$pkgver.tar.gz"
    "youtube-tv-desktop-app.desktop"
)
sha256sums=(
    a91911eafe473485ff3ee36e6aef08361e0cbea4391312a0b1cb24120a822bab
    f3e6149e45a29e634990583a8f23c9ef6fd3d26aef903fd377b4c52c9fd88759
)

build() {
    cd "$srcdir/youtube-tv-desktop-$pkgver"
    npm install
    npm run build-prod
    sed -i '1s;^;#!/usr/bin/env electron\n;' build/index.js
}

package() {
    install -Dm755 "$srcdir/youtube-tv-desktop-$pkgver/build/index.js" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/youtube-tv-desktop-$pkgver/youtube-512x512.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "youtube-tv-desktop-app.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}