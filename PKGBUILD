# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=readknead
pkgver=0.1.0
pkgrel=1
pkgdesc="Knead your sequencing reads before baking: clips, demultiplexes, filters and trims reads"
arch=("x86_64")
url="https://sr.ht/~vejnar/ReadKnead"
license=("MPLv2")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/ReadKnead/archive/v${pkgver}.tar.gz")
sha1sums=('7b2a708e33f61ec85169d3452331cb147e1826ed')

build() {
    cd "$srcdir/ReadKnead-v${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver" ./cmd/...
}

package() {
    cd "$srcdir/ReadKnead-v${pkgver}"
    install -Dm 755 readknead -t "${pkgdir}/usr/bin"
}
