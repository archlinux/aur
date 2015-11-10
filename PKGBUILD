# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=numberwang-git
_gitname=numberwang
pkgver=0.4.r1.g5bee7d6
pkgrel=1
pkgdesc="Easily copy file names from shell command output"
arch=(x86_64 i686)
url=https://github.com/robbiev/numberwang
license=(MIT)
makedepends=(git go)
provides=(numberwang)
conflicts=(numberwang)
source=(git+https://github.com/robbiev/numberwang)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

build() {
    cd "$srcdir/$_gitname"
    go build
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 numberwang "$pkgdir/usr/bin/numberwang"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
