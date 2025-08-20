# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=tufw
pkgver=0.2.4
pkgrel=1
pkgdesc="Terminal UI for ufw"
arch=("x86_64")
url="https://github.com/peltho/tufw"
license=("MIT")
depends=("ufw")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")

prepare() {
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
        -o build/$pkgname cmd/$pkgname/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
