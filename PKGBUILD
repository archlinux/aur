# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>

_gitname=libbtbb
pkgname=libbtbb-git
pkgver=2014.02.R2.r53.gac7dabc
epoch=2
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
arch=('i686' 'x86_64')
url="https://github.com/greatscottgadgets/libbtbb"
license=('GPL2')
depends=(python)
makedepends=(cmake python2 git)
provides=('libbtbb')
conflicts=('libbtbb')
source=(git://github.com/greatscottgadgets/libbtbb)
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DTHREADSAFE=ON -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  make -C $_gitname DESTDIR="$pkgdir" install
}
