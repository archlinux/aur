# $Id$
# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Emanuele Rampichini <emanuele.rampichini@gmail.com>

pkgname=smb4k-git
pkgver=2.0.80.r28.b95a5eb
pkgrel=1
pkgdesc="A KDE program that browses samba shares"
arch=(x86_64)
url="https://smb4k.sourceforge.net/"
license=(GPL)
depends=(kparts hicolor-icon-theme)
makedepends=(git extra-cmake-modules kdoctools python plasma-framework)
source=('git+git://anongit.kde.org/smb4k.git')
conflicts=(smb4k)
provides=(smb4k)
sha256sums=(SKIP)

pkgver() {
	cd smb4k
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	[ -e build ] && rm -rf build
	mkdir -p build
}

build() {
	cd build

	cmake ../smb4k \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DKDE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	make
}

package() {
	cd build

	make DESTDIR="$pkgdir" install
}
