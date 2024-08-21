# Maintainer: geov <code@mail.geov.name>

pkgname=tgp
pkgrel=4
pkgver=0.9.8
pkgdesc="tgp telegram proxy written in go"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/geovex/tgp"
makedepends=('git' 'go')
source=(
    "https://github.com/geovex/tgp/archive/refs/tags/v${pkgver}.tar.gz"
    tgp.service
    tgp.toml
)
sha256sums=('3e48f848e9fe4e1a19c7c04dd3f4e92176cdcc88d959e48d02460da6931390b4'
            '61a78cb68d8e86ffbcb5e8a4328bd3581548531cc6fe5b02f6058176c97566b2'
            '6db88fa41605a2bc1244e4110a33e0f71aa60598a7712d7f42525151ece60e23')

backup=("etc/tgp.toml")

build() {
    cd $pkgname-$pkgver
    export GOPATH="${srcdir}"
    export GOFLAGS="-trimpath -modcacherw"
    go build ./cmd/tgp
}

package() {
    install -Dm755 "$pkgname-$pkgver/tgp" "$pkgdir/usr/bin/tgp"
    install -Dm644 "tgp.service" "$pkgdir/usr/lib/systemd/system/tgp.service"
    install -Dm644 "tgp.toml" "$pkgdir/etc/tgp.toml"
}
