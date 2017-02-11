# Maintainer: codl <aur@codl.fr>

pkgname=wuzz-git
_pkgname=wuzz
pkgver=v0.1.0.r5.g46994a8
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

pkgver() {
    cd "$SRCDEST/$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf gopath
    mkdir -p gopath/src
    mv "$srcdir/$_pkgname" gopath/src
    cd "gopath/src/$_pkgname"
    env GOPATH="$srcdir/gopath" go get -v
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m 755 "$srcdir/gopath/bin/$_pkgname" "$pkgdir/usr/bin"
}
