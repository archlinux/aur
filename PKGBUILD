# Maintainer: envolution
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libjwt2
_pkgname=libjwt
pkgver=2.1.2
pkgrel=1
pkgdesc="JWT C Library (Legacy v2 branch)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/benmcollins/libjwt"
license=('MPL-2.0')
depends=('jansson' 'openssl' 'gnutls')
checkdepends=('check')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('cb6114ea6a01a61367fdb7fc11ee708110e3c7f7fc74a6c3266c03321841ee17')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-valgrind --disable-doxygen-doc
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
# vim:set ts=2 sw=2 et:
