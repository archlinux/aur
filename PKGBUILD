pkgname=hmat-oss
pkgver=1.11.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapacke')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('111f5cf45eeb70ba5e377c970af118b914029d07088dc15f1c6e81afe470e26a')

prepare() {
  cd $pkgname-$pkgver
  sed -i "s|1.10.0|1.11.0|g" CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_UNITY_BUILD=ON -DBLA_VENDOR=Generic .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

