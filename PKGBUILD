# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.3.0
pkgrel=3
pkgdesc='A graphical configuration tool for Compton X composite manager'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('LGPL2.1')

groups=('lxqt')
depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'qt5-tools' 'lxqt-build-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	#"https://github.com/lxde/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
	"https://downloads.lxqt.org/downloads/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
)
validpgpkeys=(
	# Alf Gaida <agaida at siduction dot org>
	'7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3'
)
sha256sums=(
	'7cd239d7542816ee002e6ab2b7e1211102e5ddc6588cc8eaf3d7c0462ff1e6f7'
	'SKIP' # GPG signature
)

prepare() {
	# Build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
