# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.2.0
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager. Qt5 UI.'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('LGPL2.1')

depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'qt5-tools' 'liblxqt')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/lxde/${pkgname}/archive/${pkgver}.tar.gz"
	'desktop_entry.patch'
)
sha512sums=(
	'8a386b936877ce516433e71329ae8e2531fec3b22e76f71b3d6fb16bbfa920bf0c508218001b0060b50e7b709746e96f4c50af8debc02b363035874e63301b6e'
	'1874fd90bb791542440c444d7809a03f651045f2acde7db194d309f67c75d81cacf656912f4b4837fade265994737522a0b51b347fc930296ce6ce70051b020e'
)

prepare() {
	# Patch desktop entry
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -p1 < ../desktop_entry.patch

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
