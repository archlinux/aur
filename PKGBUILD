# Maintainer: Eden Tyler-Moss <eden@etylermoss.com>

pkgname=youtube-tv-desktop-app
pkgver=1.1.2
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
    8ccb4972fac3f54ee60b5eae8d202db7f9d1f323db32faf8c233bb6d371e2a5e
    1f2ec585415633a4b322c8733fccbfd07f07eccbf7d6701722d90f9229a7effc
)

build() {
    cd "$srcdir/youtube-tv-desktop-$pkgver"
    npm install
    npm run build-prod
    sed -i '1s;^;#!/usr/bin/env electron\n;' build/index.js
}

package() {
    install -Dm755 "$srcdir/youtube-tv-desktop-$pkgver/build/index.js" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/youtube-tv-desktop-$pkgver/build/preload.js" "$pkgdir/usr/share/$pkgname/preload.js"
    install -Dm644 "$srcdir/youtube-tv-desktop-$pkgver/youtube-512x512.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "youtube-tv-desktop-app.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
