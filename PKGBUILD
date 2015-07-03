# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=yafaray-git
pkgver=513.ff262af
pkgrel=1
pkgdesc="A free open-source raytracing engine"
arch=('i686' 'x86_64')
url="http://www.yafaray.org/"
license=('LGPL2.1')
depends=('libxml2' 'openexr' 'libjpeg')
optdepends=('qt4: QT GUI' 'python: Python bindings' 'yafaray-blender-exporter-git: Exporter for Blender')
makedepends=('cmake' 'git' 'qt4' 'swig' 'python')
provides=('yafaray')
conflicts=('yafaray')
source=('yafaray::git+git://github.com/YafaRay/Core.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/yafaray"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/yafaray"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAF_PY_VERSION=3.4 \
    -DYAF_BINDINGS_PY_DIR=/usr/lib/python3.4 \
    .
  make
}

package() {
  cd "$srcdir/yafaray"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
