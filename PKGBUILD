# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=vanity-monero
pkgver=0.2.7
pkgrel=2
pkgdesc="Generates vanity address for CryptoNote currencies. Currently only Monero main net and test net are supported."
arch=("x86_64" "i686")
url="https://github.com/monero-ecosystem/vanity-monero"
license=("MIT")
makedepends=("go" "git")
provides=("vanity-monero=$pkgver")
conflicts=("vanity-monero")
source=("https://codeload.github.com/monero-ecosystem/vanity-monero/tar.gz/v$pkgver")
sha256sums=("b0f5bf201799ac35a9ddac73d832827876398c7cdfd353286bb282b00bd23e26")

prepare() {
    tar -xf v$pkgver
}

build() {
    cd "vanity-monero-$pkgver"
    go build -o vanity-monero cmd/vanity-monero/main.go
}

package() {
    install -Dm 755 "$srcdir/vanity-monero-$pkgver/vanity-monero" "$pkgdir/usr/bin/vanity-monero"
    install -Dm 0644 "$srcdir/vanity-monero-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/vanity-monero/LICENSE"
}
