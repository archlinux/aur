# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=ring-kde
_commit=a18fdff652cd8e94ef026c06e5f7f606ab47dbc3
pkgver=2.3.0.r287.g${_commit:0:7}
pkgrel=1
pkgdesc="KDE client for Ring (ring.cx)"
arch=('i686' 'x86_64')
url="https://commits.kde.org/${pkgname}"
license=('GPL3')
groups=('ring')
depends=('libringclient' 'knotifyconfig' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'python' 'glu' 'kinit')
source=(${pkgname}-${pkgver}.zip::"https://github.com/KDE/${pkgname}/archive/${_commit}.zip")
sha256sums=('ce0e07c8f9840a9b38343fcd93b0ddfd1ea1322b10ebf7c31866d140aa1bab06')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${pkgname}-${_commit} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
