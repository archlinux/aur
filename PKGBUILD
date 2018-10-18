# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=cpp-hocon
pkgver=0.2.1
pkgrel=1
pkgdesc="C++ port of the Typesafe Config library"
arch=('x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
makedepends=('boost' 'cmake' 'leatherman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz")
sha512sums=('fcc377da7923b77436a6f2787d5b8b1b573f239de4f059c4a5949cbb1a755fd12024b9155f5e44cf60141181942f3e9a2a8fad07ee0b1d516fe2cd4a88d4ac8b')

build() {
  cd "$pkgname-$pkgver"

  # Do not treat warnings as errors
  CXXFLAGS+=' -Wno-error'

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd "$pkgname-$pkgver"

  make test
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
