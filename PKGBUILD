# Maintainer: hizani

pkgname=qtox-toktok
_pkgname=qTox
pkgver=1.18.4
pkgrel=3
pkgdesc='Powerful Tox client written in C++/Qt (TokTok fork)'
arch=('x86_64')
url='https://github.com/TokTok/qTox'
license=('GPL3')
depends=('qt6-svg' 'tox' 'libexif' 'ffmpeg' 'qrencode' 'sqlcipher' 'openal' 'libglvnd')
optdepends=('sonnet>=6.0: spell checking support' 'xscreensaver>=1.2: auto-away status support')
makedepends=('base-devel' 'cmake' 'qt6-tools')
source=("https://github.com/TokTok/qTox/releases/download/v1.18.4/v${pkgver}.tar.xz")
sha512sums=('b2af8c3d73925cbe573cfe41a9e97e5432226427e00ce5a04ee570cff14a465bc6df9c55ebddce0e56fa3fb31f7248d1ae521a30b6ae77deee6cf2335a33554c')

build() {
  cd ${_pkgname}-v${pkgver}
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUPDATE_CHECK=OFF \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel $(nproc)
}

check() {
  cd ${_pkgname}-v${pkgver}
  cmake --build build --target test
}

package() {
  cd ${_pkgname}-v${pkgver}
  DESTDIR="$pkgdir" cmake --install build
}
