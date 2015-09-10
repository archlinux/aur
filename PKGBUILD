# Maintainer: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=keepassx2
pkgver=2.0beta2
pkgrel=1
_dlver=2.0-beta2
_dlno=115
pkgdesc="Crossplatform port of Windows' application  ''KeePass Password Safe''"
arch=('i686' 'x86_64')
url="https://www.keepassx.org/dev/"
license=('GPL2' 'GPL3')
depends=('shared-mime-info' 'libxtst' 'qt4')
makedepends=('intltool' 'cmake')
conflicts=('keepassx' 'keepassx2-git')
options=(!emptydirs)
install=keepassx2.install
source=("https://www.keepassx.org/dev/attachments/download/${_dlno}/keepassx-${_dlver}.tar.gz")
sha256sums=('5828261226c441856bd12e2f4f73af1a5fc3b1981b2cff40fbc2403e344f4e52')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

build() {
	cd "${srcdir}/keepassx-${_dlver}"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake $_cmake_keys ..
	make
}

package() {
	cd "${srcdir}/keepassx-${_dlver}/build"
	make DESTDIR="${pkgdir}" install
}
