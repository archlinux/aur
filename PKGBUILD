# Maintainer: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>
#               (adapted from work by Louis R. Marascio <lrm at fitnr dot com>)
# Contributor: trader <trader9 at gawab dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=quantlib
_pkgname=QuantLib
pkgver=1.24
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('x86_64')
url="http://quantlib.org"
license=('BSD')
options=(!libtool)
depends=('boost-libs')
makedepends=('make' 'boost' 'gcc')
source=("Quantlib-$pkgver.tar.gz::https://github.com/lballabio/QuantLib/releases/download/QuantLib-v$pkgver/QuantLib-$pkgver.tar.gz")
sha256sums=('ddda3707002b5af3103bf8b9ac250b233bd06de111c0faca031f2931d884b2e7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"/
  autoupdate acinclude.m4 configure.ac
  autoreconf
  ./configure --prefix=/usr --enable-intraday --enable-openmp --disable-static --enable-std-classes
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"/
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

# vim:set ts=2 sw=2 et:
