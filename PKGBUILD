# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=libqxt
pkgver=0.6.2
pkgrel=5
_pkgsuffix=dadc327c2a6a
pkgdesc='Provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit'
arch=('i686' 'x86_64')
url='http://www.libqxt.org'
license=('CPL' 'LGPL2.1')
depends=('qt4' 'openssl' 'db')
makedepends=('avahi' 'libxrandr')
optdepends=('avahi: Zeroconf support')
options=('!emptydirs')
source=("http://bitbucket.org/${pkgname}/${pkgname}/get/v${pkgver}.tar.bz2"
	'libqxt-linking.patch'
	'libqxt-media-keys.patch'
	'libqxt-header-fix.patch'
	'libqxt-gcc6.patch')
sha256sums=('be890afa72158a2074e1f625dcc16716e3e61202f035f1b8528af570760b466b'
	'0a993e1b45ab885e87fbcceb31652833a287b93d33d0184b6c6786d76f9a7b50'
	'2696813b70ddaea284228901fd545213c0b8dacc8aa0cd0f2a7e10537ff1e3cc'
	'3f92674e0c4aa54351362c61f98606957a7224a43eedfa337081f2013203cd85'
	'48f54a303371813c1325293c00d15bb597d689947fddab630f8edc373f59d3fc')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	patch -p1 -i '../libqxt-linking.patch'
	patch -p1 -i '../libqxt-media-keys.patch'
	patch -p1 -i '../libqxt-header-fix.patch'
	patch -p1 -i '../libqxt-gcc6.patch'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	./configure -qmake-bin '/usr/bin/qmake-qt4' \
	            -prefix '/usr' \
	            -libdir '/usr/lib' \
	            -docdir '/usr/share/doc'
	make
	#make docs
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	make INSTALL_ROOT="${pkgdir}" install
}
