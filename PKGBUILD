# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libblockdev
pkgver=1.5
_realver="${pkgver}-1"
pkgrel=1
pkgdesc='A library for manipulating block devices'
arch=('x86_64' 'i686')
depends=('device-mapper' 'cryptsetup' 'dmraid' 'volume_key' 'nss')
makedepends=('python3' 'gtk-doc' 'gobject-introspection')
license=('GPL')
url='https://github.com/rhinstaller/libblockdev'
source=("${pkgname}-${_realver}.tar.gz::https://github.com/rhinstaller/${pkgname}/archive/${pkgname}-${_realver}.tar.gz"
	'0001-libm.patch'
	'0002-python.patch'
	'0003-dmraid.patch')
sha256sums=('55968245038d6229b614d15c0db169f6e12ba2ad33f2168cead7e6846b320969'
	'97f36bb74eaf2a79a64f5c6c497145a8278878b13c0c464db587d18d62898f88'
	'99d8b9fb3c6db9904d24bdf99bca178abc2de65c031342cc5632f27f1a528af3'
	'639626d048adb526dc5266bbd530fc0a26f9ad1dd212ce73e344c2909d3b43f9')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_realver}/"

	patch -Np1 < "${srcdir}"/0001-libm.patch
	patch -Np1 < "${srcdir}"/0002-python.patch
	patch -Np1 < "${srcdir}"/0003-dmraid.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_realver}/"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_realver}/"

	make DESTDIR="${pkgdir}" install
}

