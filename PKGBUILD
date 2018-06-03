# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=cpp-hocon
pkgver=0.1.6
pkgrel=2
pkgdesc="C++ port of the Typesafe Config library"
arch=('x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
makedepends=('boost' 'cmake' 'leatherman')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz)
md5sums=('e76992d0346067756ca66c768f714a87')

build() {
  cd $pkgname-$pkgver

  # Do not treat warnings as errors
  CXXFLAGS+=' -Wno-error'

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
