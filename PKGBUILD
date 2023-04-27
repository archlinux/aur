# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=1
pkgver=0.9.0
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('e52a20881f74b3df3a20cc75ecf41a79d1c7e468719595c42cc2f56c376a6d26'
            '61a78cb68d8e86ffbcb5e8a4328bd3581548531cc6fe5b02f6058176c97566b2'
            '3f050e2934ad71d28acfb55a15b65d3dc269844e42b5f1707d449edce0290f54')

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
