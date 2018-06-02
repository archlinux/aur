# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma-runners-translator
pkgver=1.0.0
pkgrel=2
pkgdesc="Translates words and sentences into any language"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/krunner-translator"
license=('GPL3')
groups=()
depends=('krunner')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-tools')
optdepends=()
provides=()
conflicts=('kdeplasma-addons-runners-translator')
replaces=(plasma5-runners-translator)
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/krunner-translator/archive/v1.0.0.tar.gz')
noextract=()
md5sums=('211028f8dd09542d5c99073e8a09dcdb')

prepare() {
  cd krunner-translator-${pkgver}
  mkdir -p build
}

build() {
  cd krunner-translator-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DQT_PLUGIN_INSTALL_DIR=`qtpaths --plugin-dir` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd krunner-translator-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
