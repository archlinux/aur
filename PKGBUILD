# Maintainer: maz-1 < ohmygod19993 at gmail dot com >

_gitname=kio_afc
pkgname=kio-afc-git
pkgver=20150724.gec02633
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Apple devices"
url="https://github.com/cjacker/kio_afc"
license=(GPL)
depends=(libimobiledevice usbmuxd kio)
makedepends=(extra-cmake-modules git kdesignerplugin)
source=("git+https://github.com/cjacker/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
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
