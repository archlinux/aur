# Maintainer: dreieck
# Contributor: Felix Golatofski <contact (at) xdfr.de>
# Contributor: juantascon <juantascon.aur (at) horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot (at) aur.archlinux.org>
# Contributor: arjan <arjan (at) archlinux.org>
# Contributor: Tom Newsom <Jeepster (at) gmx.co.uk>

_pkgname=libtrash
pkgname="${_pkgname}"
pkgver=3.7
pkgrel=2
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="http://pages.stern.nyu.edu/~marriaga/software/libtrash/"
license=('GPL')
depends=('glibc')
makedepends=('autoconf')
install="${_pkgname}.install"
source=(
  "http://pages.stern.nyu.edu/~marriaga/software/libtrash/${_pkgname}-${pkgver}.tgz"
  "${install}"
)
sha256sums=(
  'e8396a2781e9febc14634df36e1cd6eced4bd5d220d5638d0b20a96108136642'
  '64fa677e8ee51caf6030283304bd8f437615adaf8a318db9f7ff4a31a435d13a'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./autogen.sh
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
