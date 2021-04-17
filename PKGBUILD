# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-pictures-git
pkgver=r173.6acafc7
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
    'git+https://github.com/BLumia/pineapple-pictures.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/pineapple-pictures

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/pineapple-pictures
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/pineapple-pictures DESTDIR="$pkgdir" install
    cd ${srcdir}/pineapple-pictures
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/pineapple-pictures-git
    install ./LICENSE ${pkgdir}/usr/share/licenses/pineapple-pictures-git/LICENSE
}
