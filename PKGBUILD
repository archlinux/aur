# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaezr <kaezr.dev at gmail dot com>

pkgname=starpsx-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="A cross-platform Sony PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
depends=('libgcc')
provides=('starpsx')
conflicts=('starpsx')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/StarPSX-$pkgver-linux-x86_64.AppImage")
sha256sums=('c25288505b8765d3a9d8f0f4ae2e0f41916c901f9ec5aa252a313c1550ba5ca8')

prepare() {
    chmod +x "$pkgname-$pkgver"
    "./$pkgname-$pkgver" --appimage-extract >/dev/null
}

package() {
    cd squashfs-root
    install -Dm755 usr/bin/starpsx -t "$pkgdir/usr/bin"
    install -Dm644 starpsx.desktop -t "$pkgdir/usr/share/applications"
}
