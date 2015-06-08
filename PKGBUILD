# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kdeplasma-applets-miniplayer-git
pkgver=v2.5.18.g5ca780f
pkgrel=1
pkgdesc="A plasmoid for playing multimedia. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Mini+Player?content=95501"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdeplasma-applets-miniplayer')
conflicts=('kdeplasma-applets-miniplayer')
source=('miniplayer::git+https://github.com/Emdek/plasmoid-mini-player.git')
sha1sums=('SKIP')

pkgver() {
  cd miniplayer
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../miniplayer" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
