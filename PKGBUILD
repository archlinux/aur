# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt
pkgver=0.17.2
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
makedepends=('go-pie')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('72a381f17d9576d16c3f082cc1eb416bf8940088bb1d124c4b62a615ec0201dc')

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
