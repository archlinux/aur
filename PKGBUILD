#  Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=nco
pkgver=5.1.2
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=("GPL")
depends=('netcdf' 'udunits' 'gsl' 'curl' 'ccr')
makedepends=('antlr2')
arch=('x86_64')
options=('!libtool')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/nco/nco/archive/$pkgver.tar.gz"
  'use_antlr2.patch'
)
sha256sums=(
  '1b86303fc55b5a52b52923285a5e709de82cbc1630e68b64dce434b681e4100a'
  '242be592df0682ea06b6562cb313c97b7efa4fe56bbd5d700d833a8c14e88bc3'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/use_antlr2.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin \
    --enable-ccr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install install-html
}
# vim:set ts=2 sw=2 et:
