# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=box
pkgver=0.2.0
pkgrel=2
pkgdesc='Create a box around incoming text'
arch=('x86_64')
url="https://github.com/AlphaLynx0/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('69255f34e0d792aa1211afa37cd3532bf47066bc0b11126c707987cac342e42e191bdb884875b362e28800b4283c366387a56554e8bcd03678ef9a13cc69d00c')

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build -o box .
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
