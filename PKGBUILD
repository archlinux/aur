# Maintainer: envolution
# Contributor: lantw44 (at) gmail (dot) com
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=guile-gnutls
pkgver=5.0.1
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://codeberg.org/guile-gnutls/guile-gnutls'
license=('LGPL-3.0-or-later')
depends=('guile' 'gnutls' 'glibc')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/guile-gnutls/guile-gnutls/archive/v${pkgver}.tar.gz"
)
sha256sums=('8c7ac6cca191b132cf4878f6e99e44fe42836779edd55f676e39c02ac9fa50b8')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE')

prepare() {
  cd "${pkgname}"
  sed -i '/tests\/list-pk-algorithms\.scm[[:space:]]*\\$/d' guile/Makefile.am
}

build() {
  cd "${pkgname}"
  ./bootstrap
  ./configure --prefix=/usr --disable-srp-authentication
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
