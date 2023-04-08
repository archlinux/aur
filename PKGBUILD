# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=1
pkgver=0.7.1
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('a24e8c5af463baaca8a861e7d5873bcf772411203cefeba5843de898219cfcf6'
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
