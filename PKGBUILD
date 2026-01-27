# Maintainer: Lenar Imamutdinov <lenar dot imamutdinov at gmail dot com>
pkgname=h2status
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight status bar for sway/i3"
arch=('x86_64')
url="https://github.com/neoden/h2status"
license=('MIT')
depends=()
makedepends=('go')
optdepends=('bluez: bluetooth support')
provides=('h2status')
conflicts=('h2status-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neoden/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f35368b7848263d5798e35cf9a582cf7c178ebc8cad16f1796332e80bb4f8bb')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 config.example.toml "$pkgdir/usr/share/$pkgname/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
