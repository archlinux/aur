# Maintainer: Sebastian Stark <sstark+aur@mailbox.org>
pkgname=nerdshade
pkgver=1.2.0
pkgrel=1
pkgdesc="hyprsunset client to smoothly transition color temperature during sunrise/sunset"
arch=("x86_64")
url="https://github.com/sstark/nerdshade"
license=('MIT')
depends=('hyprsunset' 'hyprland')
makedepends=('git' 'go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sstark/nerdshade/archive/refs/tags/rel-$pkgver.tar.gz")
sha256sums=('6e68f5f088e764ea8fe41225724057823b27230f5a5e96505233a1f2a65f0750')
_commit=("f5f05d651b7b453229a7234e0c0a27e70232d9c3")

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-rel-$pkgver"
    GOARCH=amd64 GOOS=linux go build -o nerdshade .
}

package() {
    cd "$pkgname-rel-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" nerdshade
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
