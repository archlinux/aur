# Maintainer: Nicolas Quiénot <niQo @ aur>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: thn81 <root@scrat>

pkgname=grail
pkgver=3.1.0
pkgrel=1
pkgdesc="Gesture Recognition And Instantiation Library"
arch=('i686' 'x86_64')
url="https://launchpad.net/grail"
license=('GPL')
depends=('frame>=2.5.0' 'libxi')
makedepends=('inputproto')
conflicts=('utouch-grail')
replaces=('utouch-grail')
options=('!libtool')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('f0f8c56430ee3717778dec6452201c33')

build() {
  cd "$pkgname-$pkgver"

  # Static library needed for tests
  ./configure --prefix=/usr # --disable-static
  MAKEFLAGS="-j1"
  make ${MAKEFLAGS}
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

