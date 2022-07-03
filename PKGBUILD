# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=eqmk
pkgver=0.9.4
pkgrel=1
pkgdesc="command line tool to manage encryption enabled qmk devices"
arch=('x86_64')
url="https://gitea.olznet.de/eqmk/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://gitea.olznet.de/eqmk/eqmk/archive/v$pkgver.tar.gz")
sha256sums=('e2ab9ffc0a8c70aa8cbb54f60816056d91ac22013f4d9daf4c37278bf2d6228f')

build() {
    cd $pkgname
    GOPATH="$srcdir/go" go build \
        -buildmode=pie \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname .
}

package() {
    cd $pkgname
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
