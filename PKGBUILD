pkgname=qt-notes
pkgver=0.1.2
pkgrel=1
pkgdesc='Qt 6 desktop sticky notes application with per-note encryption'
arch=('x86_64')
url='https://github.com/jswysnemc/qt-notes'
license=('MIT')
depends=('qt6-base' 'libsodium' 'libsecret')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d59aafbb536c3a3ea427526d6a8edb9a28830cf7f9d6946d770209069e1a0c64')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
