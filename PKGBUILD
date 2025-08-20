# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver='3.10.11'
pkgrel=1
epoch=
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
groups=()
depends=(binutils qt5-base qt5-multimedia qt5-svg qt5-websockets qt5-x11extras zeromq)
makedepends=(cmake clang)

_dir="PlotJuggler-${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
    "plotjuggler3.10.9-1.patch"
    "plotjuggler3.10.9-2.patch"
)
noextract=()
validpgpkeys=()

prepare() {
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.10.9-1.patch"
    patch -d PlotJuggler-$pkgver -Np1 -i "$srcdir/plotjuggler3.10.9-2.patch"
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
sha256sums=('55999c7111e60216b344ace06197761cdf1c57cd051c5d49ad0c0458077d383b'
            'f20a39a311c02973009aabebfd2934afd8db7819ab1be8157039496c88baebcb'
            '1b0b3c7f774f5736e17b180ccdeb9f5468184e337848ae12efeb7b1b90fcad29')
sha256sums=('9492e6b5f676a237616db056d1d45cae64d9a880690e8dd6b93784dd205b93bb'
            'f20a39a311c02973009aabebfd2934afd8db7819ab1be8157039496c88baebcb'
            '1b0b3c7f774f5736e17b180ccdeb9f5468184e337848ae12efeb7b1b90fcad29')
