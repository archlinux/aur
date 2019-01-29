# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.14.0
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager'
arch=('i686' 'x86_64')
url='https://github.com/lxqt/compton-conf'
license=('LGPL2.1')

groups=('lxqt')
depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'qt5-tools' 'lxqt-build-tools>=0.6.0')

source=(
	#"https://github.com/lxqt/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
	"https://downloads.lxqt.org/downloads/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
)
validpgpkeys=(
	# Alf Gaida <agaida at siduction dot org>
	'7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3'
)
sha256sums=(
	'11b7ffca00024fb49906e9fbc9ef4efaf646514778d21a1463d253e152d48bd6'
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
