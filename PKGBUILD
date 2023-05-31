# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex
pkgver=2.9.1
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6144d6be330de611de2c343c2999d78f2b59a4eeafd2ba5ddc06180c95c8e232')

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
