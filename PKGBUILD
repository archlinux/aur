# Maintainer Dan T. <dnt@tuta.io>
# Credit to 6.0.5 maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.0.6
pkgrel=2
pkgdesc="A tool to convert a GRF file into graphics files and meta data, and vice versa"
arch=('i686' 'x86_64')
url=https://github.com/OpenTTD/grfcodec
license=('GPL2')
depends=(libpng)
makedepends=('boost')
provides=("nforenum")
conflicts=('nforenum')
replaces=('nforenum')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4675db1d98de2559ef79611b455712928e21e561f130ceca166355a1fb3be9a77e5bf1f435259f8fd4788472a6ec7fb67efaaa520d0ed610182d99ee87949cdf')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's@/usr/local@/usr@' Makefile.bundle
}

_make () {
  make CXXFLAGS="${CXXFLAGS} -Wno-narrowing -std=c++11" LDFLAGS="${LDFLAGS}" "$@"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _make DESTDIR="${pkgdir}" install
}
