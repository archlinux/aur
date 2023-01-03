# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Andrew Sun  <adsun701 at gmail dot com>
# Contributor: Kritias     <theodoridisgr at gmail dot com>
# Contributor: sudokode    <sudokode at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

_pkg="isl"
_major="25"
_pkgbase="lib${_pkg}"
_pkgname="lib${_pkg}-static"
pkgname="${_pkgbase}${_major}-static"
pkgver="0.${_major}"
pkgrel=1
_pkgdesc=('Library for manipulating sets and relations of integer '
         'points bounded by linear constraints')
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
url="https://${_pkgbase}.sourceforge.io"
license=('MIT')
depends=('gmp')
provides=("${_pkg}" "lib${_pkg}.so")
replaces=("${_pkg}")
options=(staticlibs)
source=("https://${_pkgbase}.sourceforge.io/${_pkg}-${pkgver}.tar.xz")
b2sums=('54a13ba8a5d7666f62f3fb20db278d15b803400cb8b69f119b18fd1f54f7d02f1e07cd1e189803fc416afaa81b35e2247ef6b3da3d8cddc463b05cc9b3921890')

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  ./configure --prefix=/usr \
              --enable-static \
              --disable-shared
  make
}

check() {
  cd "${srcdir}"/${_pkg}-${pkgver}
  make check || true
}

package() {
  cd "${srcdir}"/${pkg}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}"/usr/share/gdb/auto-load/usr/lib/
  # mv "${pkgdir}"/usr/lib/libisl.so.*-gdb.py "${pkgdir}"/usr/share/gdb/auto-load/usr/lib/
  
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgbase}/LICENSE
}
