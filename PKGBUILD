# Maintainer: Romain Bertrand <romain@doxin.net>
pkgname=bbt
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool for Bitbucket Cloud"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/romaintb/bbt"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/romaintb/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c20e7b20012d16d50cefbc3c19be878197082e24421b4e09c5ab8aefcf7732a2')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GO111MODULE=on
    go build -ldflags="-s -w" -o bbt .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" bbt
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
