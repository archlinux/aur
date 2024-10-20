# Maintainer: Patrik Bachan <patrikbachan at gmail dot com>
pkgname=serialplot-hg
_pkgname=serialplot
pkgver=881.6e94a5867d7c
pkgrel=1
pkgdesc="Small and simple software for plotting data from serial port in realtime"
arch=('i686' 'x86_64')
url="https://hackaday.io/project/5334-serialplot-realtime-plotting-software"
license=('GPL3')
depends=('qwt' 'qt5-base' 'qt5-serialport' 'hicolor-icon-theme')
makedepends=('mercurial' 'cmake')
provides=('serialplot')
conflicts=('serialplot')
source=('hg+https://hg.sr.ht/~hyozd/serialplot')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cmake -B build -S "${srcdir}/${_pkgname}" \
        -DBUILD_QWT=false \
        -DCMAKE_CXX_FLAGS=-DUPDATE_TYPE_PKGMAN \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
  cmake --build build
}
package() {
  DESTDIR="$pkgdir" cmake --install build
}
