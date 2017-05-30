# Maintainer: David Demelier <markand@malikania.fr
pkgname=vera++
pkgver=1.3.0
pkgrel=2
pkgdesc="A programmable tool for verification, analysis and transformation of C++ source code"
arch=(i686 x86_64)
url="https://bitbucket.org/verateam/vera"
license=('custom:boost')
depends=('sh' 'gcc-libs' 'tcl' 'boost' 'python')
makedepends=('cmake')
source=(https://bitbucket.org/verateam/vera/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('f702f0e99253c7410a02029e185df0a7')

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build

  # Disable Lua because it fails to download at the moment.
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DVERA_LUA=Off -DVERA_USE_SYSTEM_BOOST=On
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
