pkgname=hmat-oss
pkgver=1.7.1
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('8ff641ec6b1ae290ee8d67ba5880fb636659c5f150e84daa826d93140500b3ed')

prepare() {
  cd $pkgname-$pkgver
  curl -L https://github.com/jeromerobert/hmat-oss/pull/80.patch | patch -p1
  curl -L https://github.com/jeromerobert/hmat-oss/pull/81.patch | patch -p1
}

build() {
  cd $pkgname-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

