# Maintainer: formerhuman <joonas115 {ÄT} gmail {dot} com>
# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

_basedlurl=https://downloads.sourceforge.net/project/
pkgname=gopherus
pkgver=1.2.2
pkgrel=2
pkgdesc="Gopher client"
arch=('x86_64' 'i686')
url="http://gopherus.sourceforge.net"
license=('BSD-2-Clause')
depends=('glibc' 'ncurses' 'hicolor-icon-theme')
source=("${_basedlurl}/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.desktop"
        'LICENSE')
sha256sums=('ee5ffb64ae4a43f576626d3649b734a801a8bf7e8fe0fd21556cc8cdb4338a9a'
            'c30160937ee338232192721d944d1258fb2f69502a8f58a6239bcf3024fd0227'
            '34faddf64b63c84f0bdb12321515bce3314f9192662f57707bedf79fc1dd123d')

build() {
  cd "${pkgname}-${pkgver}"
  make -f Makefile.lin CFLAGS="${CFLAGS}" gopherus
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dvm0755 gopherus "${pkgdir}/usr/bin/gopherus"

  install -Dvm0644 "${srcdir}/${pkgname}.desktop" -t \
    "${pkgdir}/usr/share/applications/"

  install -Dvm0644 icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dvm0644 gopherus.txt history.txt todo.txt -t \
    "${pkgdir}/usr/share/doc/${pkgname}/gopherus/"

  install -Dvm0644 "${srcdir}/LICENSE" -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
