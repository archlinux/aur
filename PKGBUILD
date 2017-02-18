# Maintainer: codl <aur@codl.fr>

pkgname=wuzz
pkgver=0.2.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("https://github.com/asciimoo/wuzz/archive/v${pkgver}.tar.gz")
sha256sums=('92b2ee013ef87a609bbfb388fafdb86073a1df87e200238ee00ac4ce54c02435')
_goname="github.com/asciimoo/wuzz"


build() {
    rm -rf gopath
    mkdir -p gopath/src/${_goname}
    mv "$srcdir/$pkgname-$pkgver/"* "gopath/src/${_goname}"
    cd "gopath/src/${_goname}"
    env GOPATH="$srcdir/gopath" go get -v
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m 755 "$srcdir/gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
