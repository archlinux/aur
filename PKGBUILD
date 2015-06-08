
pkgname=libxcm-git
pkgver=0.5.3.17.gad12c37
pkgrel=1
pkgdesc="A library containing the a reference implementation of the net-color specs. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.oyranos.org/libxcm/"
license=('BSD')
depends=('libxfixes' 'libxmu')
makedepends=('git')
conflicts=('libxcm')
provides=('libxcm')
source=("git+https://github.com/oyranos-cms/libxcm.git")
md5sums=('SKIP')
_gitname="libxcm"

pkgver() {
  cd libxcm
  echo "$(git describe --long --tags | sed 's|libXcm-||g' | tr - .)"
}

build() {
  cd libxcm
  LDFLAGS+=" -lm" ./configure --prefix=/usr
  make
}

package() {
  make -C libxcm DESTDIR="${pkgdir}" install
  install -Dm644 libxcm/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

