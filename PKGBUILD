# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=gapk
pkgname=osmo-gapk
pkgver=1.1
pkgrel=2
pkgdesc="Osmocom GSM Audio Pocket Knife"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/gapk"
license=('GPL')
depends=('libosmocore' 'talloc' 'alsa-lib' 'gsm' 'opencore-amr')
conflicts=("${pkgname}-git")
provides=('libosmogapk.so=0-64')
source=("https://downloads.osmocom.org/releases/${_pkgname}/${_pkgname}-v${pkgver}.tar.bz2")
sha256sums=('fddfb7cb0b3ee9b5a90f390a93a9a433a33ba80e25c00945d9fc2514da9ca433')

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

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
