# Maintainer: Stevan <stevp003@gmail.com>
pkgname=ttune
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal based guitar tuner"
arch=('x86_64' 'aarch64')
url="https://github.com/SteveMCWin/ttune"
license=('MIT')
depends=('portaudio')
install=$pkgname.install
makedepends=('go' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SteveMCWin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36264cbff703cfa00d3bc9b9c6def383f27675ff4ea4c2d66929ba1246e07f68')

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
