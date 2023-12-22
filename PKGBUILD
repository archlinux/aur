# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=1
pkgver=0.9.4
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('5274d4b75cae0fa69c39941d1b8b52b66dd57f0d9ff831a5e5a2b2c5502d8489'
            '61a78cb68d8e86ffbcb5e8a4328bd3581548531cc6fe5b02f6058176c97566b2'
            '24caa0995bb3454964db1f79afdec1eeb739da4ff00adf638578d99dfe8537e1')

backup=("etc/tgp.toml")

build() {
    cd $pkgname-$pkgver
    export GOFLAGS="-trimpath"
    go build ./cmd/tgp
}

package() {
    install -Dm755 "$pkgname-$pkgver/tgp" "$pkgdir/usr/bin/tgp"
    install -Dm644 "tgp.service" "$pkgdir/usr/lib/systemd/system/tgp.service"
    install -Dm644 "tgp.toml" "$pkgdir/etc/tgp.toml"
}
