# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=kio-gdrive
pkgname=$_gitname-git
pkgver=r81.fc75343
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Google Drive"
url="https://projects.kde.org/kio-gdrive"
license=(GPL)
depends=(libkgapi)
makedepends=(extra-cmake-modules git kdesignerplugin)
source=("git://anongit.kde.org/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
