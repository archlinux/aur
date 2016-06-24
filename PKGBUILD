# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gocryptfs
pkgver=0.12
_tag=v0.12
pkgrel=1
pkgdesc="Encrypted overlay filesystem written in Go."
arch=('i686' 'x86_64')
url="https://github.com/rfjakob/gocryptfs"
license=('MIT')
depends=('gcc-libs>=5.3.0-3 openssl')
makedepends=('git' 'go')
source=("git+https://github.com/rfjakob/gocryptfs.git#tag=$_tag"
        "gocryptfs.1")
md5sums=('SKIP'
         '95a1a12f44265dbf68a3c4da8ef62f5c')

prepare() {
    export GOPATH="$PWD/GO"
    mkdir -p $GOPATH/src/github.com/rfjakob
    ln -sf $PWD/gocryptfs $GOPATH/src/github.com/rfjakob/
    go get -d github.com/rfjakob/gocryptfs
}

build() {
    export GOPATH="$PWD/GO"
    $GOPATH/src/github.com/rfjakob/gocryptfs/build.bash
}

package() {
    install -Dm755 "$PWD/GO/bin/gocryptfs" "$pkgdir/usr/bin/gocryptfs"
    install -Dm644 "gocryptfs.1" "$pkgdir/usr/share/man/man1/gocryptfs.1"
}
