_pkgname=allegro5
pkgname=$_pkgname-git
pkgver=5.1.11.259.g58360b3
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming'
arch=('i686' 'x86_64')
url='http://liballeg.org/'
license=('custom')
depends=('jack' 'libxpm' 'libxxf86dga' 'libgl' 'physfs' 'gtk2' 'libpulse' 'alsa-lib')
makedepends=('cmake' 'gcc' 'mesa' 'glu' 'git')
source=('git+https://github.com/liballeg/allegro5.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe | sed s/-/./g
}

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR=$pkgdir install
}
