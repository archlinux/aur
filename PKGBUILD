# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=1
pkgver=0.8.1
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('dab35bc256ff12518f0895cdf1a6b10b1c4f2fd07468ba2bf4f8754e27911686'
            '61a78cb68d8e86ffbcb5e8a4328bd3581548531cc6fe5b02f6058176c97566b2'
            'abdc2e8716593acf86486688c846fec97bcda363de407f681f6bd78af63a2ff8')

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
