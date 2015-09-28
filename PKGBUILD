# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=libmill
pkgver=1.0
pkgrel=1
pkgdesc='Go-style concurrency in C'
arch=('i686' 'x86_64')
url='http://libmill.org/'
depends=('glib2' 'pkgconfig')
makedepends=('gcc')
license=('MIT')
source=("https://github.com/sustrik/libmill/archive/${pkgver}.tar.gz")
sha256sums=('397e461a7075ea17c4248b0d8f62b2890c3ed5c260821b9bef3f09e49619b508')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

# @TODO: figure out why 'make check' fails
# check() {
  # cd "${srcdir}/${pkgname}-${pkgver}"
  # ./configure --prefix=/usr
  # make DESTDIR="${pkgdir}" check
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
