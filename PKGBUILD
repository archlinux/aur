# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="enigma-cracker"
pkgver=0.1 # from configure.in
_pkgver="prealpha-.001"
pkgrel=1
pkgdesc="A program to break the WWII Enigma code"
arch=('x86_64' 'i686')
url="https://${pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${_pkgver}"
validpgpkeys=('C026AC9DCA230B40F76584F6FCB04E248D0A77B7') # Mike Stunes <stunes@mit.edu> (https://enigma-cracker.sourceforge.net/pgp.html)
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc}.tar.gz"
        "${_pkgsrc}.tar.gz.sig::https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc}.tar.gz.sig")
b2sums=('50358fced9a99167a00f982e07bae15cfaec264026df8fe9d2a8aa37f0a30190a232bcbe7eaaf04f0f18c0ef0c03332a3a8eaf8753a5f6f81bc2a62397ce5a9e'
        'SKIP')

build() {
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr'
  make
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make install DESTDIR="${pkgdir}"

  # install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  # install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
