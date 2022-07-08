# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
_repouser=post-factum
_reponame=bandwidthd
pkgver=2.0.11
pkgrel=2
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url="https://codeberg.org/post-factum/bandwidthd"
license=(GPL)
depends=(sqlite libpcap libpng gd nginx)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/${_repouser}/${_reponame}/archive/v${pkgver}.tar.gz)

sha256sums=('e9a42e675012ab3c95e9d968a67c1c3fa53d41b1cc81205a7f3625d5a85c94ea')

backup=('etc/bandwidthd/bandwidthd.conf'
		'etc/bandwidthd/bandwidthd-webui.conf')

build() {
	cd ${_reponame}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${_reponame}

	meson install -C build --destdir "${pkgdir}"
}
