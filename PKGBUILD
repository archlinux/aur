# Maintainer: Antonis Geralis <capoiosct@gmail.com>

_pkgname=dungeon
pkgname=dungeon-gdt-glk
pkgver=3.2
pkgrel=1
pkgdesc="Dungeon is the original Zork text adventure."
arch=('i686' 'x86_64')
url="http://gunkies.org/wiki/Zork"
license=('custom')
depends=('glkterm')
makedepends=('make')
provides=("${_pkgname}" "${_pkgname}-glk")
conflicts=("${_pkgname}" "${_pkgname}-glk")
source=("http://www.ifarchive.org/if-archive/games/source/${pkgname}.tar.gz" "${pkgname}.patch")
sha256sums=('d6587be3f10dda85e152bb6c17966157bc9378f4ad6013b81b9fd285fd122032'
            'f43151034031bcb6881802b3a4ee739302adc3ce8c7497f93b20262d13603178')

prepare() {
  cd "${srcdir}/${_pkgname}-gdt"
  patch -Np1 -i ../${pkgname}.patch
}

build() {
  cd "${srcdir}/${_pkgname}-gdt"
  make dungeon
}

package() {
  cd "${srcdir}/${_pkgname}-gdt"
  # executable
  install -Dm755 dungeon "${pkgdir}/usr/bin/${_pkgname}"
  # data file
  install -Dm644 dundat "${pkgdir}/usr/share/${_pkgname}/dundat"
  # license
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  grep -A 25 'Copyrights and Other Verbiage' README > "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
