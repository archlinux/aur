# Maintainer: Sebastian Stark <sstark+aur@mailbox.org>
pkgname=nerdshade
pkgver=1.3.0
pkgrel=1
pkgdesc="hyprsunset client to smoothly transition color temperature during sunrise/sunset"
arch=("x86_64")
url="https://github.com/sstark/nerdshade"
license=('MIT')
depends=('hyprsunset' 'hyprland')
makedepends=('git' 'go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sstark/nerdshade/archive/refs/tags/rel-$pkgver.tar.gz")
sha256sums=('7f1989086cc5f8bfc4699dbec73e34c2b8575331c07f6f89ad7c9b88dff25d1c')
_commit=("a6536e98048d2a21778b645eb534473eda803e08")

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
