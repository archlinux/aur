# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.16.0
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager'
arch=('i686' 'x86_64')
url='https://github.com/lxqt/compton-conf'
license=('LGPL2.1')

groups=('lxqt')
depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'qt5-tools' 'lxqt-build-tools>=0.7.0')

source=(
	"https://github.com/lxqt/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
)
validpgpkeys=(
	# Key for compton-conf prior to 0.15.0
	# Alf Gaida <agaida at siduction dot org>
	'7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3'

	# Key for compton-conf starting from 0.15.0
	# Not available outside GitHub (https://github.com/tsujan.gpg)
	# Pedram Pourang <tsujan2000@gmail.com>
	'19DFDF3A579BD509DBB572D8BE793007AD22DF7E'
)
sha512sums=(
	'23ddd816638914f7ce0c0a0b38e7048f4062d76618694f4f5b58c778fba85ca3838c00e576b1cd50d43df496970eac3ce9a53f758ad2aa3c7cc5a900947d5835'
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
