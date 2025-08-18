# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=box
pkgver=0.2.1
pkgrel=1
pkgdesc='Create a box around incoming text'
arch=('x86_64')
url="https://github.com/AlphaLynx0/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8dcd4f4d4f97604ae0880fc3085b6b2cd5ad31c6b81defa0bf2a87834b7a6f6c218ac494725288b75dbe681075e3c7f599fc7256578d0f702234d3b0292118dd')

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
