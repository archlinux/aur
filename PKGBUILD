# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gocryptfs
pkgver=0.10_rc3
_tag=v0.10-rc3
pkgrel=1
pkgdesc="Encrypted overlay filesystem written in Go."
arch=('i686' 'x86_64')
url="https://github.com/rfjakob/gocryptfs"
license=('MIT')
depends=('gcc-libs>=5.3.0-3 openssl')
makedepends=('git' 'go')
source=("git+https://github.com/rfjakob/gocryptfs.git#tag=$_tag")
md5sums=('SKIP')

prepare() {
    cd gocryptfs

    mkdir -p .gopath/src/github.com/rfjakob
    ln -sf "$PWD" .gopath/src/github.com/rfjakob/gocryptfs
    export GOPATH="$PWD/.gopath"

    go get github.com/rfjakob/gocryptfs
}

build() {
    cd gocryptfs
    export GOPATH="$PWD/.gopath"

    #go build -gccgoflags -gcflags "$CFLAGS" -ldflags "$LDFLAGS"
    go build
}

package() {
    cd gocryptfs
    install -Dm755 gocryptfs "$pkgdir/usr/bin/gocryptfs"
}
