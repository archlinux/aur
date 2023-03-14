# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=geneabacus
pkgver=0.2.2
pkgrel=1
pkgdesc="Gene counter and profiler."
arch=("x86_64")
url="https://git.sr.ht/~vejnar/GeneAbacus"
license=("MPLv2")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/GeneAbacus/archive/v${pkgver}.tar.gz")
sha256sums=('b2d3168151fe5346ca55c8d5e4bd3289d70473ee38599956235e1357aeb96101')

build() {
    cd "$srcdir/GeneAbacus-v${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver" ./cmd/...
}

package() {
    cd "$srcdir/GeneAbacus-v${pkgver}"
    install -Dm 755 geneabacus -t "${pkgdir}/usr/bin"
}
