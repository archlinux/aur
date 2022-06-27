# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=eqmk
pkgver=0.9.1
pkgrel=1
pkgdesc="command line tool to manage encryption enabled qmk devices"
arch=('x86_64')
url="https://gitea.olznet.de/eqmk/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://gitea.olznet.de/eqmk/eqmk/archive/v$pkgver.tar.gz")
sha256sums=('2f61356bc803e44be331e4161a1aba87989e898d975488e54224aa06caf2fa64')

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
