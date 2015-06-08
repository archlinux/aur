# Maintainer: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=keepassx2
pkgver=alpha6
pkgrel=2
pkgdesc="Crossplatform port of Windows' application  ''KeePass Password Safe''"
arch=('i686' 'x86_64')
url="https://www.keepassx.org/dev/"
license=('GPL2' 'GPL3')
depends=('shared-mime-info' 'libxtst' 'qt4')
makedepends=('intltool' 'cmake')
conflicts=('keepassx' 'keepassx2-git')
options=(!emptydirs)
install=keepassx2.install
source=("https://www.keepassx.org/dev/attachments/download/69/keepassx-2.0-${pkgver}.tar.gz")
sha256sums=('592f9995b13c4f84724fb24a0078162246397eedccd467daaf0fd3608151f2b0')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

build() {
	cd "$srcdir/keepassx-2.0-$pkgver"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake $_cmake_keys ..
	make
}

package() {
	cd "$srcdir/keepassx-2.0-$pkgver/build"
	make DESTDIR="${pkgdir}" install
}
