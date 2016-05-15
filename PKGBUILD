# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libdill
_ver=0.3
_pkgver=${_ver}-beta
pkgver=${_ver}.beta
pkgrel=1
pkgdesc='Structured concurrency in C'
arch=('i686' 'x86_64')
url='http://libdill.org/'
depends=('pkgconfig')
options=('!buildflags')
makedepends=('gcc')
license=('MIT')
source=("https://github.com/sustrik/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('a07cf61a9a218dc40291004f5dd621a1ad427ed88afc456e54a18ae7d7d57387')

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
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
