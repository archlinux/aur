#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libxcm-git
pkgver=0.5.3.41.g29efdc3
pkgrel=1
pkgdesc="A library containing the a reference implementation of the net-color specs. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.oyranos.org/libxcm'
license=('BSD')
depends=('libxfixes'
         'libxmu'
         )
makedepends=('git')
conflicts=('libxcm')
provides=('libxcm')
source=("git+https://github.com/oyranos-cms/libxcm.git")
sha256sums=('SKIP')

pkgver() {
  cd libxcm
  echo "$(git describe --long --tags | sed 's|libXcm-||g' | tr - .)"
}

prepare() {
  cd libxcm
  autoreconf -f
}

build() {
  cd libxcm
  ./configure \
    --prefix=/usr
  make
}

package() {
  make -C libxcm DESTDIR="${pkgdir}" install
  install -Dm644 libxcm/docs/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

