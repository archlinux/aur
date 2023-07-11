# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex
pkgver=3.2
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b48cde13d031b7f5a4b3b6e656307fea100c0c57202f714ac612295e1d40f45e')

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
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}
