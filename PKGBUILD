# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=gapk
pkgname=osmo-gapk
pkgver=1.1.2
pkgrel=1
pkgdesc="Osmocom GSM Audio Pocket Knife"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/gapk"
license=('GPL-3.0-or-later')
depends=('libosmocore' 'talloc' 'alsa-lib' 'gsm' 'opencore-amr')
conflicts=("${pkgname}-git")
provides=('libosmogapk.so=0-64')
source=("https://downloads.osmocom.org/releases/${_pkgname}/${_pkgname}-v${pkgver}.tar.bz2")
sha256sums=('f0507fc25cb5170bf5ae75ed5c02efc504561e70b5ffe7c460be13bb9e73d000')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --libdir=/usr/lib/
#             --enable-gsmhr (makedepends += python)
  make
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
