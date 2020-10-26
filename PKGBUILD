# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

_pkgname=simulide
pkgname=${_pkgname}-svn
pkgver=r503
pkgver_base="0.3.12"
pkgver_dash="0.3.12-SR3"
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=('i686' 'x86_64' 'aarch64')
url="http://simulide.blogspot.com/"
license=('GPL3')
makedepends=('subversion')
provides=('simulide')
conflicts=('simulide')
source=("$_pkgname::svn+https://svn.code.sf.net/p/${_pkgname}/svnrepo/trunk" "simulide.desktop")
md5sums=('SKIP'
         'beda8f4452562e5cc1e2c9a19ac99bb3')
depends=(
  'gpsim'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-svg'
  'qt5-tools'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}/${_pkgname}/build_XX
  qmake
  make
}

package() {
  cp -r ${srcdir}/${_pkgname}/build_XX/release/SimulIDE_${pkgver_dash} ${pkgdir}/usr
  mkdir -p "${pkgdir}"/usr/share/applications
  install -Dm644 "${srcdir}"/simulide.desktop "${pkgdir}"/usr/share/applications/simulide.desktop
}
