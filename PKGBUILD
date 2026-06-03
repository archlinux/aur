# Maintainer: hizani

pkgname=qtox-toktok
_pkgname=qTox
pkgver=1.18.5
pkgrel=4
pkgdesc='Powerful Tox client written in C++/Qt (TokTok fork)'
arch=('x86_64')
url='https://github.com/TokTok/qTox'
license=('GPL3')
depends=('qt6-svg' 'tox' 'libexif' 'ffmpeg' 'qrencode' 'sqlcipher' 'openal' 'libglvnd')
optdepends=('sonnet>=6.0: spell checking support' 'xscreensaver>=1.2: auto-away status support')
makedepends=('base-devel' 'cmake' 'qt6-tools')
source=("https://github.com/TokTok/qTox/releases/download/v${pkgver}/qTox-${pkgver}.tar.xz")
sha512sums=('b2f0886e885206a70dc3915bd6d7ca0051ce8c4b15c3f42f1e769583cf11609a7ff2cdb47715404db17ee638ce5636d128064bef50314c711194a9840cc8bfae')

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
