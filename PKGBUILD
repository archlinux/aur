#  Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=nco
pkgver=5.2.1
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=('BSD-3-Clause')
depends=('netcdf' 'udunits' 'gsl' 'curl' 'ccr')
makedepends=('antlr2')
arch=('x86_64')
options=('!libtool')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/nco/nco/archive/$pkgver.tar.gz"
  'use_antlr2.patch'
)
sha256sums=(
  'd3975f9e3ee659ed53690a887be8e950c90fc1faed71f2969896427907557ac3'
  'db3e62369ab803d6aad302ff4327b081963dfb2641c82aad51d2f800b0c3db4c'
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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
