# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=3.0
_ver=04102017
_gitver=gab130d
_pkgver="${_ver}.0-${_gitver}"
pkgrel=1
pkgdesc='Implementtion of C11 Annex K + ISO TR24731 Bounds Checking Interface'
arch=('i686' 'x86_64')
url='https://rurban.github.io/safeclib'
_url='https://github.com/rurban/safeclib'
depends=('pkgconfig')
makedepends=('gcc')
license=('Unkown')
# https://github.com/rurban/safeclib/releases/download/v04102017/libsafec-04102017.0-gab130d.tar.bz2
source=("${_url}/releases/download/v${_ver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('0fc3a6aba297ed585ec04311af06377ad5ad427102f28426ba79c7dfccea78b1')

# prepare() {
#   cd "${srcdir}/${pkgname}-${_pkgver}"
#   ./build-tools/autogen.sh
# }

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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
