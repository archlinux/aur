# Maintainer: Stevan <stevp003@gmail.com>
pkgname=ttune
pkgver=0.8.2
pkgrel=1
pkgdesc="Terminal based guitar tuner"
arch=('x86_64' 'aarch64')
url="https://github.com/SteveMCWin/ttune"
license=('MIT')
depends=('portaudio')
makedepends=('go' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SteveMCWin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4b9ea642b9ff2991b301b78b74c3cabb00b72f4ced84a64fa9715d2c89eeba1')

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
