# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.2.0
pkgrel=2
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/leatherman/archive/$pkgver.tar.gz)
md5sums=('0325aea11c16f624b99546a77c138dad')

prepare() {
  cd $pkgname-$pkgver

  # Ruby 2.3 fix: replace rb_data_object_alloc symbol with rb_data_object_wrap
  sed -i 's/rb_data_object_alloc/rb_data_object_wrap/g' \
    $( grep -rl rb_data_object_alloc ruby )
}

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd $pkgname-$pkgver

  make test
}

package() {
  cd $pkgname-$pkgver

  make install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
