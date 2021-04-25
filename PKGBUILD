# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=drogon
pkgver=1.5.1
pkgrel=1
pkgdesc='A C++14/17 based HTTP web application framework running on Linux/macOS/Unix/Windows'
arch=('x86_64')
url=https://github.com/an-tao/$pkgname
license=('MIT')
depends=('brotli' 'c-ares' 'jsoncpp' 'mariadb-libs' 'postgresql-libs' 'sqlite' )
makedepends=('cmake' 'git' 'mariadb' 'postgresql' 'util-linux')
source=(git+$url.git#tag=v$pkgver)
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  git submodule update --init
}

build() {
  cd $pkgname
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  cd build
  make DESTDIR=$pkgdir install
}
