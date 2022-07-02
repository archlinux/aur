# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=eqmk
pkgver=0.9.3
pkgrel=1
pkgdesc="command line tool to manage encryption enabled qmk devices"
arch=('x86_64')
url="https://gitea.olznet.de/eqmk/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://gitea.olznet.de/eqmk/eqmk/archive/v$pkgver.tar.gz")
sha256sums=('cdd4f784c555e876bd125051bd7ccd945a336d5026a584e3e6c0ea4b30e8f32f')

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
