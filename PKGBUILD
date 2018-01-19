# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=3.2
_ver=15012018
_gitver=ge0f580
pkgrel=1
_pkgver="${_ver}.0-${_gitver}"
pkgdesc='Implementtion of C11 Annex K + ISO TR24731 Bounds Checking Interface'
arch=('i686' 'x86_64')
url='https://rurban.github.io/safeclib'
_url='https://github.com/rurban/safeclib'
depends=('pkgconfig')
makedepends=('gcc')
license=('Unkown')
# https://github.com/rurban/safeclib/releases/download/v15012018/libsafec-15012018.0-ge0f580.tar.bz2
source=("${_url}/releases/download/v${_ver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('5be339acc97b86f4c76c7c7a966e251b7ba533451eaaf0861581f70de5df0265')

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
  # temp fix
  mv "${pkgdir}/usr/share/man/man3/towlower.3" "${pkgdir}/usr/share/man/man3/towlower_s.3"
  mv "${pkgdir}/usr/share/man/man3/towupper.3" "${pkgdir}/usr/share/man/man3/towupper_s.3"
  mv "${pkgdir}/usr/share/man/man3/wcsstr.3" "${pkgdir}/usr/share/man/man3/wcsstr_s.3"
}

# vim:set ft=sh ts=2 sw=2 et:
