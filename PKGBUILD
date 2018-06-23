# Maintainer: karel

pkgname=gr-adapt-git
pkgver=r4.3cbe154
pkgrel=1
pkgdesc="Adaptive filters for GNU Radio"
arch=('i686' 'x86_64')
url="https://github.com/karel/gr-adapt"
license=('GPLv3')
depends=('gnuradio' 'libvolk')
optdepends=('armadillo: QR decomposition based filters')
makedepends=('cmake' 'git')
provides=('gr-adapt')
conflicts=('gr-adapt')
source=(${pkgname}::"git+https://github.com/karel/gr-adapt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}
