# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
pkgver=3.9.2
pkgrel=1
epoch=1
pkgdesc='Implementation of C11 Annex K + ISO TR24731 Bounds Checking Interface'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/rurban/safeclib'
depends=('perl')
makedepends=('doxygen')
provides=("$pkgname.so=3-64")
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/safeclib-$pkgver.tar.xz")
sha256sums=('2665a771854757fef9f102fe7ac2cdceaa4011a69b7210cdb5007577f8b7a6b3')

prepare() {
  cd "safeclib-$pkgver"
  # The core package man-pages already installed the towlower, towupper and
  # wcsstr manual pages, the libsafec tries to overwrite those.
  # In order to avoid overwriting core-package files, we remove the
  # installation of those files.
  sed -i '/towlower.3/d; /towupper.3/d; /wcsstr.3/d' Makefile.am
}

build() {
  cd "safeclib-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "safeclib-$pkgver"
  make check
}

package() {
  cd "safeclib-$pkgver"
  DESTDIR="$pkgdir/" make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
