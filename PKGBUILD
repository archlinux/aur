# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=gapk
pkgname=osmo-gapk
pkgver=1.1.1
pkgrel=1
pkgdesc="Osmocom GSM Audio Pocket Knife"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/gapk"
license=('GPL-3.0-or-later')
depends=('libosmocore' 'talloc' 'alsa-lib' 'gsm' 'opencore-amr')
conflicts=("${pkgname}-git")
provides=('libosmogapk.so=0-64')
source=("https://downloads.osmocom.org/releases/${_pkgname}/${_pkgname}-v${pkgver}.tar.bz2")
sha256sums=('3990ada682977f121eb5c6deb1c344d7210cf12b5a90a09dbfbc87cafcd60835')

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
