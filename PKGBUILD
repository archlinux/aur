# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=leatherman
pkgver=1.3.0
pkgrel=2
pkgdesc="Collection of C++ and CMake utility libraries"
arch=('x86_64')
url="https://github.com/puppetlabs/leatherman"
license=('APACHE')
makedepends=('boost' 'cmake' 'rapidjson')
checkdepends=('ruby')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/leatherman/archive/$pkgver.tar.gz)
md5sums=('659d2b3bc3ff34ae01b31a24bff43d21')

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
