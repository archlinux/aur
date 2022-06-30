# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=twinkle
pkgname=${_pkgname}-git
pkgver=1.10.3.r415.15ece11
pkgrel=2
pkgdesc="A SIP-based VoIP client"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url=https://twinkle.dolezel.info
license=('GPL')
depends=('libzrtpcpp' 'alsa-lib' 'libsndfile' 'bcg729' 'hicolor-icon-theme' 'qt5-declarative')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lubosd/twinkle.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo -n "$(grep -E '^set\(PRODUCT_VERSION' CMakeLists.txt | awk -F \" '{print $2}')."
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DWITH_ZRTP=ON -DWITH_G729=ON
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
