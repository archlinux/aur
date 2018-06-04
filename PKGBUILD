# Contributor: proudzhu <proudzhu.fdu at gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Albert.Zhou <albert.zhou@wiz.cn>

pkgname=wiznote-git
pkgver=2.5.6.r68.g6852009a
pkgrel=1
pkgdesc="Opensource cross-platform cloud based note-taking client"
arch=('i686' 'x86_64')
url="http://www.wiznote.com"
license=('GPL3' 'custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'qt5-websockets' 'qt5-webengine') # 'crypto++')
# shared clucene/quazip triggers segfault
makedepends=('boost' 'cmake' 'git' 'qt5-tools')
conflicts=('wiznote')
provides=('wiznote')
_wiznote_project_name="WizQTClient"
source=("git+https://github.com/WizTeam/${_wiznote_project_name}.git")
md5sums=('SKIP')


pkgver() {
  cd $_wiznote_project_name
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  #sed -e 's/add_subdirectory(cryptopp)//' \
  #    -i WizQTClient/lib/CMakeLists.txt
  #sed -e 's/cryptlib/cryptopp/' \
  #    -i WizQTClient/src/CMakeLists.txt

  rm -rf build; mkdir build
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../$_wiznote_project_name
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
