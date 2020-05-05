# Maintainer: Matteo De Carlo matteo <dot> dek <at> gmail
pkgname=raspicam
pkgver=0.1.8
pkgrel=1
pkgdesc="C++ API for using Raspberry camera (with OpenCV)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.uco.es/investiga/grupos/ava/node/40"
license=('BSD')
groups=()
depends=('vtk')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
backup=()
options=()
source=("https://downloads.sourceforge.net/project/raspicam/raspicam-${pkgver}.zip")
sha256sums=('08caa22fbe4d71296c0348855a6ea629477b5cfb08648c93bd5ea55b606656cf')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    find -name '*.cpp' -exec sed -i 's/CV_CAP/cv::CAP/g' {} +
    mkdir -p build
    cd build
    cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cd build
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cd build
    make install
}
