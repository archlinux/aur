# Maintainer: Paul Hentschel (hpmachining)

pkgname=cbang
pkgver=1.3.1
pkgrel=1
_commit=e231d612a6fbb3424b7b211d08bb367f6d9ca0f8
pkgdesc="a library of cross-platform C++ utilities"
arch=('x86_64')
url="https://github.com/CauldronDevelopmentLLC/cbang"
license=('LGPL2.1')
depends=(
  'v8-3.14'
  'libevent'
  'sqlite3'
  're2'
  'libyaml'
  'zlib'
  'bzip2'
  'expat'
  'mariadb-libs'
)
makedepends=(
  'git'
  'scons'
)
checkdepends=(
  'python2'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/cbang/archive/$pkgver.tar.gz"
)
sha256sums=('23bf2997ac8438592545f1cde7cd076ba759f3f4a01e6540cdf45a97616eaaef')

build() {
  cd "$pkgname-$pkgver"
  scons disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "$pkgname-$pkgver/tests"
  scons
  python2 ./testHarness
}

package() {
  cd "$pkgname-$pkgver"
  scons install prefix="$pkgdir/opt/$pkgname"
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/$pkgname/lib" 
  cp -a config/ "$pkgdir/opt/$pkgname/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/$pkgname/include/"
}
