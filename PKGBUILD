pkgname=qt-notes
pkgver=0.1.1
pkgrel=1
pkgdesc='Qt 6 desktop sticky notes application with per-note encryption'
arch=('x86_64')
url='https://github.com/jswysnemc/qt-notes'
license=('MIT')
depends=('qt6-base' 'libsodium' 'libsecret')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9115873fbb72e3c08d14b823af31da3bd54e4c421e9997f024cf2c21b1842dfa')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
