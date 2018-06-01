# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=nut-multimedia-git
pkgver=r690.640bf64
pkgrel=1
pkgdesc="Free multimedia container format. (Git Version)"
arch=('x86_64')
url='http://wiki.multimedia.cx/index.php?title=NUT'
license=('GPL')
depends=('glibc')
makedepends=('git')
conflicts=('nut-multimedia'
           'libnut-git'
           )
provides=('nut-multimedia'
          'libnut'
          )
source=('git+https://git.ffmpeg.org/nut.git')
sha256sums=('SKIP')

pkgver() {
  cd nut
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  CFLAGS+=" -fPIC" make -C nut/src/trunk PREFIX=/usr libnut/libnut.so
  make -C nut/src/trunk PREFIX=/usr nututils
}

package() {
  make -C nut/src/trunk PREFIX=/usr DESTDIR="${pkgdir}" install-libnut-shared
  make -C nut/src/trunk PREFIX=/usr DESTDIR="${pkgdir}" install-nututils
}
