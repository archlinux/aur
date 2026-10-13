# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

_pkgname=gopherus
_pkgver=1.2.2
pkgname=${_pkgname}-svn
pkgver=1.2.2.r271
pkgrel=1
pkgdesc="Gopher client"
arch=('x86_64' 'i686')
url="http://gopherus.sourceforge.net"
license=('BSD-2-Clause')
depends=('glibc' 'ncurses' 'hicolor-icon-theme')
makedepends=('subversion')
conflicts=('gopherus')
provides=('gopherus')
source=("${_pkgname}::svn://svn.code.sf.net/p/gopherus/code"
        "${_pkgname}.desktop"
        'LICENSE')
sha256sums=('SKIP'
            'c30160937ee338232192721d944d1258fb2f69502a8f58a6239bcf3024fd0227'
            '34faddf64b63c84f0bdb12321515bce3314f9192662f57707bedf79fc1dd123d')

pkgver() {
  cd "${_pkgname}"
  local ver="$(svnversion)"
  printf "${_pkgver}.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_pkgname}/trunk"
  make -f Makefile.lin CFLAGS="${CFLAGS}" gopherus
}

package() {
  cd "${_pkgname}/trunk"

  install -Dvm0755 gopherus -t "${pkgdir}/usr/bin/"

  install -Dvm0644 "${srcdir}/${_pkgname}.desktop" -t \
    "${pkgdir}/usr/share/applications/"

  install -Dvm0644 icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  install -Dvm0644 gopherus.txt history.txt todo.txt -t \
   "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -Dvm0644 "${srcdir}/LICENSE" -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
