# Maintainer: Marat Moustafine <m-dash-moustafine-at-yandex-dot-ru>

_pkgname=cutelyst
pkgname=$_pkgname-git
pkgver=1.0.0+2+g2f101cb
pkgrel=1
pkgdesc='A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework'
arch=('i686' 'x86_64')
url=https://github.com/$_pkgname/$_pkgname
license=('LGPL2.1')
depends=('grantlee' 'libsimplemail-qt')
makedepends=('cmake' 'git' 'uwsgi')
optdepends=('uwsgi: for the uWSGI engine')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/^r//;s/-/+/g'
}

build () {
  cd $_pkgname
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUWSGI_PLUGINS_DIR=/usr/lib/uwsgi \
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR=$pkgdir install
}
