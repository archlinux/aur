# Maintainer: Charles Vejnar

pkgname=scratch-purge
pkgver=0.1
pkgrel=1
pkgdesc="Simple tool to purge a folder used as scratch."
arch=("i686" "x86_64")
url="https://gitlab.com/vejnar/scratch-purge"
license=("MPLv2")
makedepends=("go")
source=("https://gitlab.com/vejnar/scratch-purge/-/archive/v0.1/scratch-purge-v$pkgver.tar.gz")
sha1sums=("63b1a272c10368b7fc84468a2a749655ff152279")

prepare() {
    export GOPATH="${srcdir}"
    cd "${srcdir}"
    go get -d github.com/syndtr/goleveldb/leveldb
}

build() {
    export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin"
    cd "$srcdir/$pkgname-v$pkgver/src"
    go build *.go
}

package() {
    cd "$srcdir/$pkgname-v$pkgver/src"
    install -Dm755 scratch_purge "$pkgdir/usr/bin/scratch_purge"
}
