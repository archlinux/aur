# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icingaweb2-module-grafana
pkgver=1.4.2
pkgrel=1
pkgdesc='Grafana module for Icinga Web 2 (supports InfluxDB & Graphite)'
license=('GPL')
arch=('any')
depends=('icingaweb2')
optdepends=('grafana: rendering of graphs')
url='https://github.com/Mikesch-mp/icingaweb2-module-grafana'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mikesch-mp/$pkgname/archive/v$pkgver.tar.gz"
        'https://github.com/Mikesch-mp/icingaweb2-module-grafana/commit/d59432b3a414b01df54b5dfa22b1c158afd73424.patch')
sha256sums=('f153c10d71ceeb64144fde3162921524ffb20678018290e01682e4c0a3e10a25'
            '3d7c73e7eb4962e0926162c43c995672addda795f2f3e203ab5e4830733c05eb')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -p1 -i "$srcdir/d59432b3a414b01df54b5dfa22b1c158afd73424.patch"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir/etc/icingaweb2/modules/grafana"

	mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/grafana"
	cp -r application configuration.php library module.info public run.php \
		"$pkgdir/usr/share/webapps/icingaweb2/modules/grafana"

	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc "$pkgdir/usr/share/doc/$pkgname"
	cp -r dashboards "$pkgdir/usr/share/doc/$pkgname"
}
