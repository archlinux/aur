# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=omnitux
pkgver=1.2.1
pkgrel=3
pkgdesc="Educational game based on multimedia elements"
arch=('any')
url="http://omnitux.sourceforge.net/"
license=('GPL3' 'custom')
depends=('pygtk' 'python2-pygame')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('e0c4da272baaa4f09b90cc060f7b605c'
         '28d42be661260512ca4af9627568241a'
         'cce915823d01fc9eb169cf9c1983db25')

package() {
  cd "${srcdir}/${pkgname}"

  # Fix a compatibility with Python 2
  sed -i "s/python/python2/" "${pkgname}"{,_setup}.sh

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r bin data log *.sh "${pkgdir}/usr/share/${pkgname}"

  # Install the launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install doc files
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the pixmap and .desktop file
  install -Dm644 data/default/icons/Omnitux_logo.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
