# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt
pkgver=0.15.2
pkgrel=1
pkgdesc='Like Git, but for data'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('4ad1a89bb76dec9bb3863c1dcbf200d68e02fa2c5b2f68f1e952e64a3fc9b16b')

build() {
    export GOFLAGS="-trimpath"
    cd $pkgname-$pkgver/go
    go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dolt
    go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/git-dolt
    go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/git-dolt-smudge
}

package() {
    cd $pkgname-$pkgver/go
    install -Dm755 -t $pkgdir/usr/bin/ {dolt,git-dolt,git-dolt-smudge}
}
