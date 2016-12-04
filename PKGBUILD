# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=silicon
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='A high performance, middleware oriented C++14 http web framework'
arch=('any')
url='https://github.com/matt-42/silicon'
license=('MIT')
makedepends=('cmake' 'git')
optdepends=('iod: for introspection of objects and generation code matching their data structures'
            'libmicrohttpd: for microhttpd backend')
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
