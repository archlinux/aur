# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=3.3
_ver=03032018
_gitver=g570fa5
pkgrel=1
_pkgver="${_ver}.0-${_gitver}"
pkgdesc='Implementtion of C11 Annex K + ISO TR24731 Bounds Checking Interface'
arch=('i686' 'x86_64')
url='https://rurban.github.io/safeclib'
_url='https://github.com/rurban/safeclib'
depends=('pkgconfig')
makedepends=('clang')
license=('MIT')
# https://github.com/rurban/safeclib/releases/download/v15012018/libsafec-15012018.0-ge0f580.tar.bz2
source=("${_url}/releases/download/v${_ver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('caeb1c4104e0f1cccbe6f354b1456d7f5096df2363292017618804cef72eca7d')

# prepare() {
#   cd "${srcdir}/${pkgname}-${_pkgver}"
#   ./build-tools/autogen.sh
# }

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  CC="clang -march=native -fstrict-aliasing" ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  # make check
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
