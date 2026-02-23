# Maintainer: Stevan <stevp003@gmail.com>
pkgname=ttune
pkgver=0.8.1
pkgrel=1
pkgdesc="Terminal based guitar tuner"
arch=('x86_64' 'aarch64')
url="https://github.com/SteveMCWin/ttune"
license=('MIT')
depends=('portaudio')
makedepends=('go' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SteveMCWin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41a1daddae9497b5a55f7864aadb304c25cf9ed678c5827e9b5cf23c6a5ac97e')

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
