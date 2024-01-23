# Maintainer: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>
#               (adapted from work by Louis R. Marascio <lrm at fitnr dot com>)
# Contributor: trader <trader9 at gawab dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=quantlib
_pkgname=QuantLib
pkgver=1.33
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('x86_64')
url="http://quantlib.org"
license=('BSD-3-Clause')
options=(!libtool)
depends=('gcc-libs' 'sh')
makedepends=('make' 'boost')
checkdepends=()
source=("Quantlib-$pkgver.tar.gz::https://github.com/lballabio/QuantLib/releases/download/v$pkgver/QuantLib-$pkgver.tar.gz")
sha256sums=('4810d789261eb36423c7d277266a6ee3b28a3c05af1ee0d45544ca2e0e8312bd')

prepare() {
  cd "$_pkgname-$pkgver"/
  autoupdate acinclude.m4 configure.ac
  autoreconf -if
} 

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-intraday \
    --enable-openmp \
    --disable-static \
    --enable-std-classes \
    --enable-null-as-functions \
    --enable-parallel-unit-test-runner
  make
}

package() {
  cd "$_pkgname-$pkgver"/
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

# vim:set ts=2 sw=2 et:
