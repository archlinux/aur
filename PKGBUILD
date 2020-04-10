# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=soqt-hg
pkgver=2075.2c0e8b0de743
pkgrel=1
pkgdesc="The glue between Coin & Qt"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/soqt"
license=("GPL")
depends=(coin-hg qt5-base)
makedepends=(doxygen mercurial cmake)
provides=('soqt')
conflicts=('soqt')
options=('!libtool')
source=("${pkgname}::hg+https://bitbucket.org/Coin3D/soqt"
	 "hg+https://bitbucket.org/Coin3D/cpack.d"
	 "hg+https://bitbucket.org/Coin3D/generalmsvcgeneration"
	 "hg+https://bitbucket.org/Coin3D/soanydata"
	 "hg+https://bitbucket.org/Coin3D/sogui")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(hg identify -n).$(hg identify -i)"
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake \
        -Bsoqt_build \
        -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DSOQT_BUILD_DOCUMENTATION=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
    cmake \
        --build soqt_build \
        --target all \
        --config Release
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR=${pkgdir} cmake \
           --build soqt_build \
           --target install \
           --config Release
}
