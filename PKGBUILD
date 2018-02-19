# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libdill
_ver=2.4
_pkgver=${_ver}
pkgver=${_ver}
pkgrel=1
pkgdesc='Structured concurrency in C'
arch=('i686' 'x86_64')
url='http://libdill.org/'
depends=('pkgconfig')
options=('!buildflags')
makedepends=('gcc')
license=('MIT')
source=("https://github.com/sustrik/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('ebef0b53db2312702beb11b2493cbbfb320859a60a44d0bb6aab0132ea83ba73')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  # make check
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
