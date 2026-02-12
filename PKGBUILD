# Maintainer: tm4a
pkgname=tuimer
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimal, beautiful terminal timer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/tm4a/tuimer"
license=('MIT')

depends=('alsa-lib' 'libnotify')

makedepends=('go' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=('31b5a5bbf03ebf18220519eacfbe9909a73bbbb4140eb154de54d3dff0f06b15')

build() {
    cd "$pkgname-$pkgver"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o tuimer ./cmd/tuimer
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 tuimer "$pkgdir/usr/bin/tuimer"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
