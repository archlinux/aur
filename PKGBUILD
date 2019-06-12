pkgname=hmat-oss
pkgver=1.5.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz" set_num_threads.patch)
sha1sums=('ea50bc4ee9eabd42fb81757c5549a2e592a4a434' SKIP)

prepare() {
  cd $pkgname-$pkgver
  sed -i "s|\-Werror||g" CMakeLists.txt
  patch -p1 -i "$srcdir"/set_num_threads.patch
}


build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_INCLUDE_DIR=/usr/include/hmat .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
