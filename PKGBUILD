# Maintainer: Roger Coll <rogercoll at protonmail dot com>

pkgname=otelcol
pkgver=0.119.0
pkgrel=1
epoch=
pkgdesc="OpenTelemetry Collector core distribution"
arch=('x86_64')
url="https://github.com/open-telemetry/opentelemetry-collector"
license=('APACHE')
groups=('open-telemetry')
makedepends=(
    go
    git
    systemd
)
backup=(
    etc/$pkgname/$pkgname.yaml
    etc/$pkgname/$pkgname.conf
    etc/$pkgname/config.yaml
)
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    "$pkgname.service"
    "$pkgname.conf"
    "config.yaml"
)
sha512sums=('5b39cefbed7d2aed2178a0f34418c5beca8da7ca441e303099730984801492c1dde34222c547422f14981b630be754f9bfa60e1e346757be71f3ebdb5ae38677'
            '351cb7da00ae09559ca3e48932c1f0e0a8ccd4f1bff982ce2ce8ab3b50b5eec3715f2e21c9c12d04568f6b764588a92f4641c741b148080b0222e591fb691102'
            'f51d0e59bcdcf0c1f871de1667ed15f3f500cde6aabe78d8a596c238b8a1a1daa59831a203756ac372e5c753c0db75786612c93b65b99542c2a0ffcb5023e1e4'
            'dbb544c505d67e0320a29126e919fdab0418e0dc66deda0b3660b762d974302d3eaa46251a731005b765385f71edd43c80a99e5141eba89841387a79fd28a948')


build() {
	cd "opentelemetry-collector-$pkgver"
	make otelcorecol SRC_ROOT=${PWD}
}


package() {
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname/$pkgname.conf"
    install -Dm644 config.yaml "$pkgdir/etc/$pkgname/config.yaml"
    cd "opentelemetry-collector-$pkgver"
    install -Dm755 bin/otelcorecol_linux_amd64 "$pkgdir/usr/bin/$pkgname"
}
