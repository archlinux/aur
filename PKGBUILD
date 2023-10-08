# Maintainer: Roger Coll <rogercoll at protonmail dot com>

pkgname=otelcol
pkgver=0.86.0
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
sha512sums=('80fa30e780ce08916ac2218cd2274be93c83b1393347c4088b4331ec02845330e83e823908d23fe01983e5e0cb3cb2ae637166d142dea82f34277a08237035d7'
            '351cb7da00ae09559ca3e48932c1f0e0a8ccd4f1bff982ce2ce8ab3b50b5eec3715f2e21c9c12d04568f6b764588a92f4641c741b148080b0222e591fb691102'
            'f51d0e59bcdcf0c1f871de1667ed15f3f500cde6aabe78d8a596c238b8a1a1daa59831a203756ac372e5c753c0db75786612c93b65b99542c2a0ffcb5023e1e4'
            '11e66d39858f16db3c495e41a15fbbf4c84a2046c55c4fe8f647ecf6cbeebb64464c371f6aa2809d150bf32873e006157d6bb4ed912968057fa55e96722f6701'
)


build() {
	cd "opentelemetry-collector-$pkgver"
	make otelcorecol
}


package() {
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname/$pkgname.conf"
    install -Dm644 config.yaml "$pkgdir/etc/$pkgname/config.yaml"
	cd "opentelemetry-collector-$pkgver"
    install -Dm755 bin/otelcorecol_linux_amd64 "$pkgdir/usr/bin/$pkgname"
}
