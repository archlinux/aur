# Maintainer: Devin Alexander Torres <d@devinus.io>
# Contributor:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Fabian Köhler <fabian.koehler (AT) protonmail.ch>

# shellcheck shell=bash
# shellcheck disable=2034,2154,2312

pkgname="dieharder"
pkgver=3.31.1.4
pkgrel=1
pkgdesc="A testing and benchmarking tool for random number generators"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://github.com/eddelbuettel/dieharder"
depends=('gsl')
provides=("dieharder=${pkgver}" "libdieharder=${pkgver}")
source=("dieharder-${pkgver}.tar.gz::https://github.com/eddelbuettel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0fdd8a66a077e86652a47641589aa4667ae13d322a7214bb555ab37f082002dd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  autoreconf -iv
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  make DESTDIR="${pkgdir}" install
}
