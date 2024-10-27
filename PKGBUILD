# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-pictures
pkgver=0.8.2.1
pkgrel=2
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
    'qt5-tools'
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
	'4eedfc916e642d8d4973718b598a665387426f608151f5366b8100b3ac512bde'
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
