# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chrétien <chretien dot b+arch at gmail dot com>
# Contributor: Soo-Hyun Yoo <yoos117 at gmail dot com>

pkgname=octomap
pkgver=1.9.3
pkgrel=1
pkgdesc="Efficient probabilistic 3D mapping framework based on octrees"
arch=('i686' 'x86_64')
url="http://octomap.github.com/"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
provides=('octomap')
conflicts=('octomap-git')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('8488de97ed2c8f4757bfbaf3225e82a9e36783dce1f573b3bde1cf968aa89696')

build() {
  cd "$srcdir/octomap-$pkgver/octomap"
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/octomap-$pkgver/octomap"
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
