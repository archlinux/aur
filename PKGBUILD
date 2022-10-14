# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex
pkgver=2.6
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal"
arch=('x86_64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f30e346aa4cd31b46bbba69cdd17d3bf879607bc5d67c3c2940f511458d19645')

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -trimpath -buildmode=pie -mod=readonly -modcacherw
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 clx -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
