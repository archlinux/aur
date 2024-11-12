# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=postpilot
pkgver=0.1.2
pkgrel=2
pkgdesc="A sleek local SMTP testing environment for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/watzon/postpilot"
license=('custom')
depends=('gtk3' 'webkit2gtk')
makedepends=('go' 'wails' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "postpilot.desktop")
sha256sums=('2bdb81491d5c4eed34ffb24c8ecd25523173c74cc98d311352f6da5967bf114f'
            'a862a97f3e5844306d428dd8f659cd078f0bb8d1552d5d79303896381b1c749b')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/frontend"
    npm install
    cd "$srcdir/$pkgname-$pkgver"
    go mod tidy
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    wails build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "build/bin/postpilot" "$pkgdir/usr/bin/postpilot"
    install -Dm644 "$srcdir/postpilot.desktop" "$pkgdir/usr/share/applications/postpilot.desktop"
    install -Dm644 "frontend/src/assets/images/logo.svg" "$pkgdir/usr/share/pixmaps/postpilot.svg"
}
