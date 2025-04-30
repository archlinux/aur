# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver='3.10.0'
pkgrel=1
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
sha256sums=('8b2080f7e672963064926e4e5cbc3f5b6bee6e5b01e40a8e858a2bbc6a4feeaf')
validpgpkeys=()

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "../../plotjuggler3.10.0-1.patch"
    cd "${srcdir}/PlotJuggler-${pkgver}"
}

build() {
        # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ${srcdir}/${_dir}
	make
}

package() {
        cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
