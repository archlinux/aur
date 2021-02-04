# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-pictures
pkgver=0.4.1
pkgrel=1
pkgdesc='Yet another lightweight image viewer'
arch=('x86_64')
url='https://github.com/BLumia/pineapple-pictures/'
license=('MIT')
depends=(
    'qt5-svg'
    'exiv2'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
)
optdepends=(
    'kimageformats: XCF, EXR, PSD and other extra image format support'
    'qt5-imageformats: TIFF, WEBP, and other extra image formats'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-pictures/archive/${pkgver}.tar.gz"
)
sha256sums=(
    'b0a4ddf2caa28cad4a8cff852e53235309678eca1509d2479ab53e9057fd71b9'
)

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
