# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver='3.9.2'
pkgrel=4
epoch=
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
groups=()
depends=(binutils qt5-base qt5-multimedia qt5-svg qt5-websockets qt5-x11extras arrow zeromq)
makedepends=(cmake clang)

_dir="PlotJuggler-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('d2edba7aae2c64776cc99f5ccfd80ee158ebb12fe4ebbf8b14063f295649c018')
validpgpkeys=()

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "../../plotjuggler3.9.1.patch"
    cd "${srcdir}/PlotJuggler-${pkgver}"
}

build() {
        # Create the build directory.
        [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

	cmake ${srcdir}/${_dir}
	make
}

package() {
        cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
