# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=eqmk
pkgver=0.9.2
pkgrel=1
pkgdesc="command line tool to manage encryption enabled qmk devices"
arch=('x86_64')
url="https://gitea.olznet.de/eqmk/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://gitea.olznet.de/eqmk/eqmk/archive/v$pkgver.tar.gz")
sha256sums=('70afd597d400b84ee0edddd036f363b24fc2f96b1d162ea962b265b27d652d82')

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
