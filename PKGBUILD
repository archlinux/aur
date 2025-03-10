# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=corearchiver
pkgver=5.0.0
pkgrel=1
pkgdesc="Archiver from the C Suite to create and extract archives"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'hicolor-icon-theme'
        'libcprime'
        'libarchive-qt-qt6'
)
makedepends=(
            'cmake'
            'ninja'
)
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2f82ca17bffe6ec8d3f6bad0fb3a72e6248e59340d59898d6656d4f1f371d02a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
}
