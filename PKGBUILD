# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=ring-kde
_commit=78418e81677b783b1f292b7b8bee1b33a0bf0253
pkgver=2.3.0.r277.g${_commit:0:7}
pkgrel=1
pkgdesc="KDE client for Ring (ring.cx)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/ring-kde"
license=('GPL3')
groups=('ring')
depends=('libringclient' 'knotifyconfig' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'python' 'glu' 'kinit')
source=(${pkgname}-${pkgver}.zip::"${url}/archive/${_commit}.zip")
sha256sums=('56098eef6ecd329c915463899e51e637d98425ef0d6e5b08ea09f4fd0ee1ccce')

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
