# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-pictures
pkgver=0.9.2
pkgrel=1
pkgdesc='Yet another lightweight image viewer'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/pineapple-pictures/'
license=('MIT')
depends=(
    'qt6-svg'
    'exiv2'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'kimageformats: XCF, EXR, PSD and other extra image format support'
    'qt6-imageformats: TIFF, WEBP, and other extra image formats'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-pictures/archive/${pkgver}.tar.gz"
)
sha256sums=(
	'eea01ecdea1107c5d2407a4502efc569b352a320f21ff0532788622a43c431f6'
)

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
