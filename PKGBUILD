# Maintainer: Patrick josé Pereira  <gmail.com@patrickelectric>
pkgname=mavlink-git
pkgver=1.0.12.r164.g5a18bf91
pkgrel=1
pkgdesc="MAVLink - Micro Air Vehicle Message Marshalling Library."
arch=('any')
url="https://github.com/mavlink/mavlink"
license=('GPLV3')
makedepends=('git' 'cmake' 'python2')
source=('git://github.com/mavlink/mavlink.git')
md5sums=(SKIP)
provides=('mavlink')
conflicts=('mavlink')

pkgver() {
  cd "mavlink"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "mavlink"
  git submodule update --init --recursive
  mkdir "build" || true
  cd "build"
  cmake ..
  make
}

package(){
  cd "mavlink/build"
  make DESTDIR="$pkgdir" install
}
