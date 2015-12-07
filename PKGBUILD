# Maintainer: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=keepassx2
pkgver=2.0
pkgrel=1
pkgdesc="Crossplatform port of Windows' application  ''KeePass Password Safe''"
arch=('i686' 'x86_64')
url="https://www.keepassx.org/dev/"
license=('GPL2' 'GPL3')
depends=('shared-mime-info' 'libxtst' 'qt4')
makedepends=('intltool' 'cmake')
conflicts=('keepassx' 'keepassx2-git')
options=(!emptydirs)
install=keepassx2.install
source=("https://www.keepassx.org/releases/${pkgver}/keepassx-${pkgver}.tar.gz")
sha256sums=('0eb40fac3a44d8283dfc1ee28cc6de5c660b22ab975472de82c2b04675c822e6')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

build() {
	cd "${srcdir}/keepassx-${pkgver}"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake $_cmake_keys ..
	make
}

package() {
	cd "${srcdir}/keepassx-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
