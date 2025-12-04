# Maintainer: Ken-Oleander Niin <kenoleander@gmail.com>
pkgname=fily
pkgver=1.0.0
pkgrel=1
pkgdesc="A peer-to-peer file transfer CLI tool using WebRTC"
arch=('x86_64' 'aarch64')
url="https://github.com/Kennubyte/fily-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kennubyte/fily-cli/archive/v$pkgver.tar.gz")
sha256sums=('6bdf5d86fb2d0aaa9eb32e3049a9d6278d7cb7a9935f8413289368b1bff3e064')

build() {
    cd "$srcdir/$pkgname-cli-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname-cli-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
