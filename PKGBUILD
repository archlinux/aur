# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=box-git
pkgver=0.2.0.r0.gc22cfad
pkgrel=1
pkgdesc='Create a box around incoming text'
arch=('x86_64')
url='https://github.com/AlphaLynx0/box'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('box')
conflicts=('box')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd box
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd box
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build -o box .
}

package() {
    cd box
    install -Dm755 box "$pkgdir/usr/bin/box"
    install -Dm644 man/box.1 "$pkgdir/usr/share/man/man1/box.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
