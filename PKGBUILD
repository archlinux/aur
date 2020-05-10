# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt
pkgver=0.16.4
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
makedepends=('go-pie')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('41247460a7d1b28c17e1706a5215ba6ca58984c0741c2efdf8d369cd2c768b28')

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
