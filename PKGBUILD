# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=acme-lsp
pkgver=0.11.0
pkgrel=1
pkgdesc='Language Server Protocol tools for the acme text editor'
arch=(x86_64)
url='https://github.com/fhs/acme-lsp'
license=('MIT')
makedepends=(go)
source=($url/archive/v$pkgver.tar.gz)
b2sums=('6cdef80c6679f580345eda596f5459ff9175e8071890f1b8aa3841f4d9580a1b44f3cbc71668f0279440ef14950100c7a5622add6d6be79cf6c667303202d969')

prepare() {
    cd $pkgname-$pkgver
    mkdir -p build
}

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 -t "$pkgdir/usr/bin" build/*
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
