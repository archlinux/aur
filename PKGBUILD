# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
_repouser=post-factum
_reponame=bandwidthd
pkgver=2.0.11
pkgrel=1
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url="https://gitlab.com/post-factum/bandwidthd"
license=(GPL)
depends=(sqlite libpcap libpng gd nginx)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/${_repouser}/${_reponame}/-/archive/v${pkgver}/${_reponame}-v${pkgver}.tar.bz2)

sha256sums=('0c7ff96233a778df74b99e029c86d0e1ba2172def0777f89e74d227eb53bd5fc')

backup=('etc/bandwidthd/bandwidthd.conf'
		'etc/bandwidthd/bandwidthd-webui.conf')

build() {
	cd "${_reponame}-v${pkgver}"

	arch-meson . build

	meson compile -C build
}

package() {
	cd "${_reponame}-v${pkgver}"

	meson install -C build --destdir "${pkgdir}"
}
