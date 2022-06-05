# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname='arrow-apache-arrow'
pkgname='arrow-glib'
pkgver=8.0.0
pkgrel=1
pkgdesc='Columnar in-memory analytics layer for big data'
arch=('x86_64')
url='https://arrow.apache.org'
license=('Apache')
depends=(
  "arrow>=${pkgver}"
  "glib2"
)
makedepends=('meson')
checkdepends=(
  'ruby'
  'ruby-test-unit'
  "ruby-gobject-introspection>=3.4.9"
)
source=("https://github.com/apache/arrow/archive/apache-arrow-${pkgver}.tar.gz")
b2sums=('d60e61d049a8b57b50800eae7956ed7df2bdde575aa46fb387d773b2245d344a1f2c485f2a61d6a08bbca2f28750e0ecbfc1c8272040a4a0e07989f5d5aeccb7')

build(){
  cd "arrow-apache-arrow-${pkgver}/c_glib"
  meson setup 'build' -Dprefix='/usr'
  meson compile -C 'build'
}

check() {
  cd "arrow-apache-arrow-${pkgver}/c_glib"
  meson test -C 'build' --print-errorlogs
}

package(){
  cd "arrow-apache-arrow-${pkgver}/c_glib"
  meson install -C 'build' --destdir="${pkgdir}"
}
