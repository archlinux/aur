
pkgname=xcm-git
pkgver=0.5.3.5.gac82a70
pkgrel=1
pkgdesc="libXcm based tools. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.oyranos.org/libxcm"
license=('BSD')
depends=('oyranos-git')
makedepends=('git')
provides=('xcm')
conflicts=('xcm')
source=("git+https://github.com/oyranos-cms/xcm.git")
md5sums=('SKIP')
_gitname="xcm"

pkgver() {
  cd xcm
  echo "$(git describe --long --tags | sed 's|xcm-||g' | tr - .)"
}

build() {
  cd xcm
  ./configure --prefix=/usr --with-udev-dir=/usr/lib/udev/rules.d
  make
}

package() {
  make -C xcm DESTDIR="$pkgdir" install
  install -Dm644 xcm/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
