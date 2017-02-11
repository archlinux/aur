# Maintainer: codl <aur@codl.fr>

pkgname=wuzz-git
_pkgname=wuzz
pkgver=0.1.0.r6.gecab533
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
makedepends=('go' 'git')
provides=('wuzz')
conflicts=('wuzz')
options=('!strip' '!emptydirs')
source=("git+https://github.com/asciimoo/wuzz.git")
sha256sums=("SKIP")
_goname="github.com/asciimoo/wuzz"

pkgver() {
    cd "$SRCDEST/$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf gopath
    mkdir -p gopath/src/$_goname
    mv "$srcdir/$_pkgname/"* "gopath/src/$_goname"
    cd "gopath/src/$_goname"
    env GOPATH="$srcdir/gopath" go get -v
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m 755 "$srcdir/gopath/bin/$_pkgname" "$pkgdir/usr/bin"
}
