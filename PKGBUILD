# Maintainer: Stevan <stevp003@gmail.com>
pkgname=ttune
pkgver=0.8.0
pkgrel=2
pkgdesc="Terminal based guitar tuner"
arch=('x86_64' 'aarch64')
url="https://github.com/SteveMCWin/ttune"
license=('MIT')
depends=('portaudio')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SteveMCWin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a57aacf7e0dd842b5022d40318455f2dc466ffae6dd0f810ae6dbb6ab2426258')

build() {
    cd "$pkgname-$pkgver"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
