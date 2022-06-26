# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=eqmk
pkgver=0.9.0
pkgrel=2
pkgdesc="command line tool to manage encryption enabled qmk devices"
arch=('x86_64')
url="https://gitea.olznet.de/eqmk/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://gitea.olznet.de/eqmk/eqmk/archive/v$pkgver.tar.gz")
sha256sums=('7d14d7e51ce73849ce844b026a7038bbb100f663be28cf60c5f38d9895c90534')

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
