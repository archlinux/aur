# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt
pkgver=0.21.4
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
makedepends=('go-pie')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('bb55e0fe36b8dd4fe996f6852211862f76c4ac0ea446271f607940cbfbc25eed')

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
