# Maintainer: hizani

pkgname=qtox-toktok
_pkgname=qTox
pkgver=1.18.6
pkgrel=1
pkgdesc='Powerful Tox client written in C++/Qt (TokTok fork)'
arch=('x86_64')
url='https://github.com/TokTok/qTox'
license=('GPL3')
depends=('qt6-svg' 'tox' 'libexif' 'ffmpeg' 'qrencode' 'sqlcipher' 'openal')
optdepends=('sonnet>=6.0: spell checking support' 'xscreensaver>=1.2: auto-away status support')
makedepends=('base-devel' 'cmake' 'qt6-tools')
source=("https://github.com/TokTok/qTox/releases/download/v${pkgver}/qTox-${pkgver}.tar.xz")
sha512sums=('2166eb5b771badbfe111380dd5643e2299ea54d8b88b81fcea1255fd71adac8b4469fd7d7e82b8f97b925479c03725acaa8fea642cd77551d0a97f5a80b46061')

build() {
  cd ${_pkgname}-${pkgver}
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUPDATE_CHECK=OFF \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel $(nproc)
}

check() {
  cd ${_pkgname}-${pkgver}
  cmake --build build --target test
}

package() {
  cd ${_pkgname}-${pkgver}
  DESTDIR="$pkgdir" cmake --install build
}
