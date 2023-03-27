# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=1
pkgver=0.2.2
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('d7925af3354e348c9910fbe353fab76500f9a84eef981ce5bb55bfdbc881fa9b'
            '61a78cb68d8e86ffbcb5e8a4328bd3581548531cc6fe5b02f6058176c97566b2'
            '121e76d7adac3459371d5b709e975f8fbde798ca836db471ee70dfe7fd4eb14f')

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
