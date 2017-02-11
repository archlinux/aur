# Maintainer: codl <aur@codl.fr>

pkgname=wuzz
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/asciimoo/wuzz/archive/v0.1.0.tar.gz")
sha256sums=('7752557fd00e8c6427de690fb3eaef1d0679657d1c34a43fb53faa733891f3ec')

build() {
    rm -rf gopath
    mkdir -p gopath/src
    mv "$srcdir/$pkgname-$pkgver" gopath/src
    cd "gopath/src/$pkgname-$pkgver"
    env GOPATH="$srcdir/gopath" go get -v
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m 755 "$srcdir/gopath/bin/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
