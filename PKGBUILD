# Maintainer:  dreieck
# Contributor: Felix Golatofski <contact (at) xdfr.de>
# Contributor: juantascon <juantascon.aur (at) horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot (at) aur.archlinux.org>
# Contributor: arjan <arjan (at) archlinux.org>
# Contributor: Tom Newsom <Jeepster (at) gmx.co.uk>

_pkgname=libtrash
pkgname="${_pkgname}"
pkgver=3.9
pkgrel=1
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="http://pages.stern.nyu.edu/~marriaga/software/libtrash/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('autoconf')
install="${_pkgname}.install"
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pete4abw/libtrash/archive/refs/tags/v${pkgver}.tar.gz"
  "${install}"
)
sha256sums=(
  '85e8c0299d85c993ec8b5048c33d87b097cb2005dce9364c019fb6759ede0088'
  '64fa677e8ee51caf6030283304bd8f437615adaf8a318db9f7ff4a31a435d13a'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --enable-shared

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
