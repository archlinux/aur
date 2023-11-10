# Maintainer: formerhuman <joonas115 {ÄT} gmail {dot} com>
# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
pkgname=gopherus
pkgver=1.2.2
pkgrel=1
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('BSD')
depends=('ncurses')
source=("https://downloads.sourceforge.net/project/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ee5ffb64ae4a43f576626d3649b734a801a8bf7e8fe0fd21556cc8cdb4338a9a')
#optdepends=(
#    'hicolor-icon-theme: needed for the icon'
#)

build() {
  cd "${pkgname}-${pkgver}" || exit
  make -f Makefile.lin CFLAGS="${CFLAGS}" gopherus
}

package() {
  cd "${pkgname}-${pkgver}" || exit

  install -Dm755 gopherus "${pkgdir}/usr/bin/gopherus"

  install -Dm644 gopherus.txt "${pkgdir}/usr/share/doc/${pkgname}/gopherus.txt"
  install -Dm644 history.txt "${pkgdir}/usr/share/doc/${pkgname}/history.txt"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  (
    cd "${pkgdir}/usr/share/licenses/${pkgname}" || exit
    ln -s /usr/share/doc/${pkgname}/gopherus.txt LICENSE
  )

  #install -Dm644 icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

}
