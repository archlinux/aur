# Maintainer: envolution
# Contributor: lantw44 (at) gmail (dot) com
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=guile-gnutls
pkgver=4.0.1
pkgrel=1
pkgdesc='Guile bindings for the GnuTLS library'
arch=('x86_64' 'i686' 'armv7h')
url='https://gitlab.com/gnutls/guile'
license=('LGPL-3.0-or-later')
depends=('guile' 'gnutls')
source=(
  "https://gitlab.com/gnutls/guile/-/archive/v${pkgver}/guile-v${pkgver}.tar.gz"
)
sha256sums=('3263c7fcecdb77cba14b78c40ba348ca1ea5268a6996c9c3b46bc833bc9bfd1e')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE')

prepare() {
  cd "guile-v${pkgver}"
  sed -i '/tests\/list-pk-algorithms\.scm[[:space:]]*\\$/d' guile/Makefile.am
}

build() {
  cd "guile-v${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr --disable-srp-authentication
  make
}

check() {
  cd "guile-v${pkgver}"
  make check
}

package() {
  cd "guile-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
