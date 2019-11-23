# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chrétien <chretien dot b+arch at gmail dot com>
# Contributor: Soo-Hyun Yoo <yoos117 at gmail dot com>

pkgname=octomap
pkgver=1.9.1
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
sha256sums=('9abce615d9f3f97a15ba129a10e3a01f9bef9aad178f2ef398f9a925f793c7b9')

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
