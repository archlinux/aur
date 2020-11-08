# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgbase=tudo-falcon
pkgname=$pkgbase
_pkgname=falcon
pkgver=1.3.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='Open source instrument for real-time analysis of radio resources in public LTE/LTE-A networks.'
arch=('x86_64')
url='https://github.com/falkenber9/falcon'
license=('AGPL3')
depends=('c-mnalib' 'srslte-falcon-patch-git')
makedepends=('cmake' 'boost' 'git')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/falkenber9/falcon/archive/${_pkgver}.tar.gz")
sha512sums=('0667bdfdbfe18c39fbf232594e894ace8286d95a7a187f327dca22478552a2bfc39fb0c4e7543c31cf892a65e9785daf2ba8a7d9a6aabb25a60771d044cab08c')

build() {
  echo 'Building FALCON...'

  cmake .. \
    -B "${_pkgname}-${pkgver}-build" \
    -S "${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_GENERIC=True

  make -C "${_pkgname}-${pkgver}-build" -j 4
}

package() {
  make -C "${_pkgname}-${pkgver}-build" DESTDIR="$pkgdir" install
}
