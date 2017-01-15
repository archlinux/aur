# $Id$
# Maintainer: Philipp Schmidt <philschmidt@gmx.net>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_pkgname=samba-mounter
pkgname=samba-mounter-git
pkgver=118.5b9a6d7
pkgrel=1
pkgdesc="User space mount tool for samba"
url="https://cgit.kde.org/scratch/afiestas/samba-mounter.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kauth' 'cifs-utils' 'smbclient' 'kcmutils' 'kconfig' 'kio' 'ki18n' 'solid')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('samba-mounter')

source=("git://anongit.kde.org/scratch/afiestas/samba-mounter.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir"
	mkdir -p build
	cd build

	cmake "../$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "$srcdir/build"

	make DESTDIR="$pkgdir" install
}
