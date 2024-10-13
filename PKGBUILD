# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
pkgver=2.0.13
pkgrel=2
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url=https://codeberg.org/pf-graveyard/bandwidthd
license=(GPL-2.0-or-later)
depends=(sqlite libpcap libpng gd)
makedepends=(meson)
source=(${url}/archive/v${pkgver}.tar.gz)

sha256sums=('e4761abe5e06a7ff1ecde7643d54c45390f33129c6de074fbd4df74e3c26f740')

backup=(etc/bandwidthd/bandwidthd.conf
		etc/bandwidthd/Caddyfile)

build() {
	arch-meson bandwidthd build

	ninja -C build
}

package() {
	depends+=(caddy)

	DESTDIR="${pkgdir}" ninja -C build install
}
