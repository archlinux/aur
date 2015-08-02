# Maintainer: u8sand <u8sand@gmail.com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=baka-mplayer
pkgver=2.0.3
pkgrel=2
pkgdesc='A free and open source, cross-platform, libmpv based multimedia player. Qt5 build.'
arch=('i686' 'x86_64')
url='http://bakamplayer.u8sand.net/'
license=('GPL')

depends=('mpv' 'qt5-declarative' 'qt5-svg' 'qt5-x11extras')
optdepends=(
	'mpv-git: for bleeding-edge mpv features'
	'qt5-translations: for Qt5 dialog translations'
	'youtube-dl: for remote video streaming'
)
makedepends=('git' 'qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/u8sand/Baka-MPlayer/archive/v${pkgver}.tar.gz"
)
sha512sums=('af2e79a318c8a119ef20c8721e42fa3a6c4900b5baf50613ba9de7c64cdaabbb08f0a31fc589460b544a8b67d662088cac2cdf3cc808ae128948a84882df13ab')

prepare() {
	# Make build directory
	mkdir ${srcdir}/build
}

build() {	
	# Building package
	cd ${srcdir}/build
	qmake-qt5 ../Baka-MPlayer-${pkgver}/src \
		CONFIG+=release \
		CONFIG+=install_translations \
		-spec linux-g++
	make -j $(grep -c ^processor /proc/cpuinfo)
}

package() {
	# Installing package
	cd ${srcdir}/build
	make INSTALL_ROOT=${pkgdir} install
}
