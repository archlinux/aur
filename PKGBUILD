# Maintainer: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>
pkgname=simgear
pkgver=2024.1.2
pkgrel=3
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
provides=('simgear=${pkgver}')
conflicts=('simgear-git')
arch=('x86_64')
url="http://home.flightgear.org/"
license=('LGPL-2.0-only')
depends=('openscenegraph' 'openal' 'ffmpeg' 'c-ares')
makedepends=('boost' 'cmake' 'mesa')
source=("https://gitlab.com/flightgear/simgear/-/archive/${pkgver}/simgear-${pkgver}.tar.gz")
sha256sums=('6b80360b546b2f479ef64757ade7f1d60aa1e973a8fac6c606afd251e54d2fbf')

prepare() {
  mv $srcdir/simgear-${pkgver} $srcdir/simgear
  mkdir -p $srcdir/sgbuild
}

build() {
  cd $srcdir/sgbuild
  cmake ../simgear \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIMGEAR_SHARED=ON
  make
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR=${pkgdir} install
}
