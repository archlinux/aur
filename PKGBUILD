# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=opengate
pkgver=7.2
pkgrel=1
pkgdesc="Open GATE"
arch=('x86_64')
url="https://github.com/OpenGATE/Gate"
license=('LGPL3')
groups=()
makedepends=('cmake'
	'root'
	'geant4'
	'gcc')
depends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=
changelog=
source=("https://github.com/OpenGATE/Gate/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('6b15b179ccc79065a4aef63156b3e5de')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	# Execute cmake
	cd ${srcdir}
	[ -d build ] || mkdir build
	cd build
	cmake ../Gate-${pkgver}
:
}

build() {
	cd ${srcdir}/build
	make -j$(nproc)
}

package() {
	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install
}
