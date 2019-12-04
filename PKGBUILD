# Maintainer: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>
#               (adapted from work by Louis R. Marascio <lrm at fitnr dot com>)
# Contributor: trader <trader9 at gawab dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=quantlib
_pkgname=QuantLib
pkgver=1.17
pkgrel=1
pkgdesc="A free/open-source library for quantitative finance."
arch=('x86_64')
url="http://quantlib.org"
license=('BSD')
options=(!libtool)
depends=('boost-libs' 'sh')
makedepends=('make' 'boost' 'gcc')
source=("Quantlib-$pkgver.tar.gz::https://bintray.com/quantlib/releases/download_file?file_path=$_pkgname-$pkgver.tar.gz")
sha256sums=('77443c3f9e9da3130ce0b2bce739928c14089f70d1e8abcf7dfad0adb40a84fb')

build() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  ./autogen.sh
  ./configure --prefix=/usr --enable-intraday --enable-openmp --disable-static --enable-std-classes --enable-std-function
  make
}

package() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

# vim:set ts=2 sw=2 et:
