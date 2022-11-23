# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=certgen
pkgver=1.2.1
pkgrel=1
pkgdesc='A dead simple tool to generate self signed certificates'
arch=('x86_64')
url="https://github.com/minio/$pkgname"
license=('BSD')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c33bd352971de8378aafd30356a5dc112b5d1b428efe0f840b9dd35910f54ab')

prepare(){
    cd "$pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "build/$pkgname" \
        .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
