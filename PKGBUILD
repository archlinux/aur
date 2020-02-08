# Maintainer: Felix Serrano Blanco <felixseblanc@gmail.com>

_pkgname=libtd
pkgname=${_pkgname}
pkgver=1.6.0
pkgrel=1
pkgdesc='TDLib (Telegram Database library) is a cross-platform library for building Telegram clients'
arch=('x86_64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=(
  'openssl'
  'zlib'
)
makedepends=(
  'git'
  'gcc>=4.9.2'
  'make'
  'cmake>=3.0.2'
  'gperf'
  'php'
)
provides=('libtd')
conflicts=('telegram-tdlib')
source=("$_pkgname::git+https://github.com/tdlib/td.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  rm -rf build
  mkdir build
  cd build
  CXXFLAGS=""
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
  cmake --build .
}

package() {
  cd "$srcdir/$_pkgname/build"
  mkdir -p "$pkgdir/usr"
  cmake --build . --target install
}