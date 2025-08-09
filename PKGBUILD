# Maintainer: OminduD <omindudulneth@outlook.com>
pkgname=arch-sandbox
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool to create isolated Arch Linux sandboxes"
arch=('x86_64')
url="https://github.com/OminduD/arch-sandbox"
license=('MIT')
depends=('systemd' 'zstd')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/v$pkgver.tar.gz")
sha256sums=('8e05c1d7924f4fab00f9dc3952f29fb89b7fd513c93f63d5e0c258abfece5a28')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH"
    go mod init github.com/OminduD/arch-sandbox 2>/dev/null || true
    go mod tidy
    go mod vendor
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



pkgver=1.0.1
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/v$pkgver.tar.gz")
sha256sums=('PASTE_THE_NEW_CHECKSUM_HERE')