# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
_pkgname=elvish
pkgver=r1397.5609dd1
pkgrel=1
pkgdesc="A novel Unix shell, aims to explore the potential of the Unix shell."
arch=('i686' 'x86_64')
url="https://github.com/elves/elvish"
license=('MIT')
makedepends=('git' 'go')
source=("git+https://github.com/elves/elvish.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"

    mkdir -p build/src/github.com/elves
    ln -sf "$srcdir/$_pkgname" build/src/github.com/elves/
    export GOPATH="$srcdir/build"

    go get github.com/elves/elvish
}

build() {
    cd "$srcdir/$_pkgname"
    go build
}

package() {
    install -Dm755 "$srcdir/$_pkgname/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
