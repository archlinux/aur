# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=iod
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='Meta programming utilities for C++14'
arch=('i686' 'x86_64')
url='https://github.com/matt-42/iod'
license=('MIT')
depends=('gcc-libs')
makedepends=('boost' 'cmake' 'gcc' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/^v//;s/-/+/g'
}

build () {
  cd $_pkgname
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  cd build
  make DESTDIR=$pkgdir install
}
