# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
_repouser=post-factum
_reponame=bandwidthd
pkgver=2.0.13
pkgrel=1
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url="https://codeberg.org/post-factum/bandwidthd"
license=(GPL)
depends=(sqlite libpcap libpng gd)
makedepends=(meson)
source=(https://codeberg.org/${_repouser}/${_reponame}/archive/v${pkgver}.tar.gz)

sha256sums=('e4761abe5e06a7ff1ecde7643d54c45390f33129c6de074fbd4df74e3c26f740')

backup=('etc/bandwidthd/bandwidthd.conf'
		'etc/bandwidthd/Caddyfile')

build() {
	cd ${_reponame}

	arch-meson . build

	meson compile -C build
}

package() {
	depends+=(caddy)

	cd ${_reponame}

	meson install -C build --destdir "${pkgdir}"
}
