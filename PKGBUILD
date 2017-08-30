# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=2.1.1
_ver=30082017
_gitver=g85d10b
_pkgver="${_ver}.0-${_gitver}"
pkgrel=1
pkgdesc='Implementtion of C11 Annex K + ISO TR24731 Bounds Checking Interface'
arch=('i686' 'x86_64')
url='https://rurban.github.io/safeclib'
_url='https://github.com/rurban/safeclib'
depends=('pkgconfig')
makedepends=('gcc')
license=('Unkown')
# https://github.com/rurban/safeclib/archive/v30082017.tar.gz
# https://github.com/rurban/safeclib/releases/download/v30082017/libsafec-30082017.0-g85d10b.tar.bz2
source=("${_url}/releases/download/v${_ver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('61b7489a0443a0936000fa7c5c8d8236d612ad5a0cea092e3f8204b784928f09')

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
