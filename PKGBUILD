# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
pkgname=grsim-git

pkgver=v2.2.r57.g3f6ca89
pkgrel=1
epoch=
pkgdesc="RoboCup Small Size Robot Soccer Simulator"
arch=('x86_64')
url="https://github.com/RoboCup-SSL/grSim"
license=('GPL3')
groups=()
depends=('glibc' 'mesa' 'qt5-base' 'ode' 'protobuf' 'boost' 'vartypes-qt5' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=('grsim')
conflicts=('grsim')
source=('git+https://github.com/RoboCup-SSL/grSim.git')
sha256sums=('SKIP')

pkgver() {
	cd grSim
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/grSim
	mkdir builddir && cd builddir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/grSim/builddir
	make DESTDIR="$pkgdir" install
}
