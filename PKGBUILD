# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-pictures-git
pkgver=r43.ebff682
pkgrel=1
pkgdesc='Yet another lightweight image viewer'
arch=('x86_64')
url='https://github.com/BLumia/PineapplePictures/'
license=('MIT')
depends=(
    'qt5-svg'
)
makedepends=(
    'git'
    'qt5-tools'
)
source=(
    'git+https://github.com/BLumia/PineapplePictures.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/PineapplePictures

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/PineapplePictures
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/PineapplePictures
    #make INSTALL_ROOT="$pkgdir" install
    install -Dm644 ./PineapplePictures ${pkgdir}/usr/bin/PineapplePictures
    mkdir -p ${pkgdir}/usr/share/licenses/pineapple-pictures-git
    install ./LICENSE ${pkgdir}/usr/share/licenses/pineapple-pictures-git/LICENSE
}
