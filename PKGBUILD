# Maintainer: codl <aur@codl.fr>

pkgname=wuzz
pkgver=0.3.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("https://github.com/asciimoo/wuzz/archive/v${pkgver}.tar.gz")
sha256sums=('08b3e80e9c6271527c7901f1faa5199ad3b886c665a6c44e46639a8a52cc71d7')
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
