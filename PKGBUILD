# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gocryptfs
pkgver=1.0
_tag=v1.0
pkgrel=2
pkgdesc="Encrypted overlay filesystem written in Go."
arch=('i686' 'x86_64')
url="https://github.com/rfjakob/gocryptfs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'go')
source=("git+https://github.com/rfjakob/gocryptfs.git#tag=$_tag"
        "gocryptfs.1")
md5sums=('SKIP'
         '8673c1825e688e5ecd8f1c4bf4a63205')

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
