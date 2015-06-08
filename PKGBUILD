# Maintainer: Tyler Veness <calcmogul at gmail dot com>
# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=paradiseo
pkgver=2.0.1
pkgrel=3
pkgdesc="Evolving Objects is a template-based, ANSI-C++ evolutionary computation library which helps you to write your own stochastic optimization algorithms insanely fast."
arch=('i686' 'x86_64')
url="http://eodev.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=('make' 'cmake')
conflicts=()
source=("https://gforge.inria.fr/frs/download.php/31732/ParadisEO-${pkgver}.tar.gz")
md5sums=('89f875b3f92abdb64b26c6c207fef346')
options=('staticlibs')

prepare() {
	cd $srcdir/ParadisEO-2.0

	# Fix conflict with lib64 symlink
	sed -i 's/lib64/lib/' cmake/Config.cmake
}

build() {
	cd $srcdir/ParadisEO-2.0

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd $srcdir/ParadisEO-2.0

	make install DESTDIR=$pkgdir
}

