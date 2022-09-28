# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=geneabacus
pkgver=0.2.0
pkgrel=1
pkgdesc="Gene counter and profiler."
arch=("x86_64")
url="https://git.sr.ht/~vejnar/GeneAbacus"
license=("MPLv2")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/GeneAbacus/archive/v${pkgver}.tar.gz")
sha1sums=('f2b1eb8b540264158efe674a5f138ca758354d45')

build() {
    cd "$srcdir/GeneAbacus-v${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver" ./cmd/...
}

package() {
    cd "$srcdir/GeneAbacus-v${pkgver}"
    install -Dm 755 geneabacus -t "${pkgdir}/usr/bin"
}
