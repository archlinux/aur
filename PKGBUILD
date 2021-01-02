# Maintainer: George Cave <gcave@stablecoder.ca>

pkgname=('newton-dynamics')
pkgver=3.14c
pkgrel=1
pkgdesc='A 3D physics library'
arch=('x86_64')
url='http://newtondynamics.com'
license=('custom:zlib')
makedepends=('cmake')
conflicts=('newton-dynamics')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MADEAPPS/newton-dynamics/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cmake newton-dynamics-${pkgver} -Bnewton-dynamics-${pkgver}/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DNEWTON_BUILD_SHARED_LIBS=ON \
        -DNEWTON_BUILD_SANDBOX_DEMOS=OFF \
        -DNEWTON_WITH_AVX_PLUGIN=ON \
        -DNEWTON_WITH_AVX2_PLUGIN=ON \
        -DNEWTON_WITH_SSE4_PLUGIN=ON

    make -C newton-dynamics-${pkgver}/build
}

package() {
    # install it
    make -C newton-dynamics-${pkgver}/build DESTDIR="${pkgdir}" install

    # install license
    install -Dm644 newton-dynamics-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
