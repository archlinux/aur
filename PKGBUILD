pkgname=hmat-oss
pkgver=1.6.1
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz" set_num_threads.patch)
sha256sums=('1517be8bde1c06bd8bc42d95926c72d787af95fc3d37439c911a7cea3243d2ca' SKIP)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/set_num_threads.patch
}


build() {
  cd $pkgname-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_INCLUDE_DIR=/usr/include/hmat .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

