# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgbase=tudo-falcon-git
pkgname=$pkgbase
_pkgname=falcon
pkgver=1.3.0.r0.gf90bc6a
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='Open source instrument for real-time analysis of radio resources in public LTE/LTE-A networks.'
arch=('x86_64')
url='https://github.com/falkenber9/falcon'
license=('AGPL3')
depends=('c-mnalib' 'srslte-falcon-patch-git')
makedepends=('cmake' 'boost' 'git')
provides=('tudo-falcon')
conflicts=('tudo-falcon')
source=("git+https://github.com/falkenber9/falcon.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//'
}

build() {
  echo 'Building FALCON...'

  cmake .. \
    -B "build" \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_GENERIC=True

  make -C "build" -j 4
}

package() {
  make -C "build" DESTDIR="$pkgdir" install
}
