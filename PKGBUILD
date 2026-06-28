# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-desktop
_pkgname=reasonix-desktop
pkgver=1.13.0
pkgrel=1
pkgdesc="Reasonix desktop — a Wails shell around the DeepSeek-native AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('go' 'pnpm' 'wails')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('a9f5555da3e278a71942dfd1dedf8be256a75701c73bacdd636a4606f58d42db')

build() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver/desktop"
    wails build -clean -trimpath -tags webkit2_41 \
        -ldflags "-s -w -X main.version=v$pkgver"
}

package() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    install -Dm755 "desktop/build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 desktop/build/linux/reasonix.desktop \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 desktop/build/appicon.png \
        "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
