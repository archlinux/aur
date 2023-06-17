# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex
pkgver=3.1.1
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2c2f1d44103fb51875aed86070f1cb007a19d1dae2b16b7820539c85db0c3c8a')

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
