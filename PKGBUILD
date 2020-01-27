pkgname=hmat-oss
pkgver=1.6.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz" set_num_threads.patch)
sha256sums=('441bffb2e578150d86b0f056a52a3838f56d0bef6c6257c1bf6f54b308f37125' SKIP)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/set_num_threads.patch
  sed -i "s|git_version(HMAT 1.5.0)|git_version(HMAT 1.6.0)|g" CMakeLists.txt
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

