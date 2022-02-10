# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=code-format
pkgname=geany-code-format
pkgver=0.0.1
pkgrel=1
pkgdesc='A code formatting plugin for Geany using clang-format'
url='http://codebrainz.github.io/code-format/'
arch=(x86_64)
license=(GPL2)
depends=(geany clang)
source=("${_name}-${pkgver}.tar.gz::https://github.com/codebrainz/code-format/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2a8ad4ed5e70b7935d744aba684790391630ee8401e1ceb2d0992a9e15ca77a9')


prepare() {
  cd "$_name-$pkgver"

  sed -i -e 's|cf_docdir = .*|cf_docdir = \$(docdir)|' Makefile.am
}

build() {
  cd "$_name-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
}

package() {
  cd "$_name-$pkgver"

  make DESTDIR="$pkgdir/" install
}
