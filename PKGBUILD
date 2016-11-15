# Maintainer: Marat Moustafine <m-dash-moustafine-at-yandex-dot-ru>

_pkgname=libsimplemail-qt
pkgname=$_pkgname-git
pkgver=20160317+133+dcdd51b
pkgrel=1
pkgdesc='An SMTP library written in C++ for Qt'
arch=('i686' 'x86_64')
_reponame=simple-mail
url=https://github.com/cutelyst/$_reponame
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('cmake' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_reponame
  printf '%s+%s+%s' \
    $(git log -1 --format='%cd' --date=short | sed 's/-//g') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

build () {
  cd $_reponame
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $_reponame/build
  make DESTDIR=$pkgdir install
}
