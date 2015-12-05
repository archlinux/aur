# Maintainer: argymeg <argymeg at gmail dot com>
# Contributor Tondu < thomas.gastine at wanadoo dot fr >
# Contributor: buddabrod < buddabrod at gmail dot com >
pkgname=kaffeine-git
pkgver=r1023.4a1a90e
pkgrel=1
pkgdesc="Multimedia player for KDE4"
arch=('i686' 'x86_64')
url="http://kaffeine.kde.org"
license=('GPL')
depends=('kdebase-runtime' 'vlc')
makedepends=('git' 'cmake' 'automoc4')
provides=('kaffeine')
conflicts=('kaffeine')
source=('git://anongit.kde.org/kaffeine.git')
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd kaffeine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kaffeine \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
