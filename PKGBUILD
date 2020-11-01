# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt
pkgver=0.21.1
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
makedepends=('go-pie')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('cd801191d9ad7f5431bc7b519ac6367c70026ac36915a970374ae18e149fca24')

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
