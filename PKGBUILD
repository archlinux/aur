pkgname=kenbunshoku-haki
pkgver=1.1
pkgrel=1
pkgdesc="Monitor system"
arch=(x86_64)
maintainer="Raissa Arcaro Daros <raissa.geek@gmail.com>"
url="https://github.com/Raissadev/monitor-system"
license=(GPL3)
makedepends=('go' 'libcaca')

source=("https://github.com/Raissadev/monitor-system/releases/download/v$pkgver/kenbunshoku-haki-$pkgver.tar.gz")
sha256sums=('0b65a1697e4e87e437f42739a02d57710d1fc2fa7856e3a6e6b240c02c4be2c8')

prepare(){
    mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname ../../src
}

check() {
    cd "$pkgname-$pkgver"
    # ! no has pkgs to test
    # go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}