# Maintainer: Roger Coll <rogercoll at protonmail dot com>

pkgname=otelcol-contrib
pkgver=0.90.1
pkgrel=1
pkgdesc="OpenTelemetry Collector Contrib distribution"
arch=('x86_64')
url="https://github.com/open-telemetry/opentelemetry-collector-contrib"
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
sha512sums=('3fe1f3949331db215aad40d3ce2b82eeb3460f0870457cf57a698878d2fa277a665fbf509a9d4e23dabc5eea2f0c74da1c8615aa7bea6af808e4dd2b90d7e6b3'
            'fb92f18756b964add1f24fe5f69a5a9f8ca68424304c99b65b6d0809a51f8389e42be36df3d8277abd53072074a176c1b65b038d3208c44adf067d27e8fdf578'
            'cc316fc0df97be7872813281564de1041f82febd45b827b8d03e0588dcbeaf6760beca22c9b2c80a449125be463b10125a6038233d1976056757f05f03ac117a'
            'd8949e90474fb77e41565d414081099e09aac0f40836cf7a3fd6588832d33cdd0fd0f90cb4e5c14963e498b66bd37a6dcba18d754c4b5ba496324f9c2ea04518'
)


build() {
	cd "opentelemetry-collector-contrib-$pkgver"
	make otelcontribcol
}


package() {
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname/$pkgname.conf"
    install -Dm644 config.yaml "$pkgdir/etc/$pkgname/config.yaml"
	cd "opentelemetry-collector-contrib-$pkgver"
    install -Dm755 bin/otelcontribcol_linux_amd64 "$pkgdir/usr/bin/$pkgname"
}
