# Maintainer: YOUR_NAME <your_email@example.com>
pkgname=tuimer
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal, beautiful terminal timer written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/tm4a/tuimer"
license=('MIT')

depends=('alsa-lib' 'libnotify')

makedepends=('go' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=('ae0bd2fc8b7205e13f34f0c9e9ec3a6830a7870e5df6506aaacd398d76015f56')

build() {
    cd "$pkgname-$pkgver"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o tuimer .
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 tuimer "$pkgdir/usr/bin/tuimer"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
