# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=twinkle
pkgname="${_pkgname}"-git
pkgver=1.11.0.r3.g7e0eab6
pkgrel=1
pkgdesc="A SIP-based VoIP client"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url=https://twinkle.dolezel.info
license=('GPL-2.0-only')
depends=('libsndfile' 'bcg729' 'speex' 'libzrtpcpp' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lubosd/twinkle.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always --tags | sed 's|^v||;s|-|.r|;s|-|.|'
}

build() {
  cmake -B build -S ${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DWITH_G729=ON -DWITH_SPEEX=ON -DWITH_ZRTP=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
