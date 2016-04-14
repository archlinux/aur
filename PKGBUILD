# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgname=transmission-remote-gui-qt4
_pkgname=transgui
pkgver=5.3.0
pkgrel=1
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=(i686 x86_64)
url='https://github.com/leonsoft-kras/transmisson-remote-gui'
license=(GPL2)
depends=(qt4pas)
makedepends=(lazarus unzip)
provides=(transmission-remote-gui)
conflicts=(transmission-remote-gui-gtk2 transmission-remote-gui-svn transmission-remote-gui)
install=transmission-remote-gui.install
source=(https://github.com/leonsoft-kras/transmisson-remote-gui/archive/v${pkgver}.zip
        ${_pkgname}.desktop)
md5sums=(efece16944d4e6b3fb2d9849cebc3438
         c0504cb6d4e970892ac7be9206c787b5)
_ws=qt

build() {
  mkdir "${srcdir}/config"
  cd "${srcdir}/transmisson-remote-gui-${pkgver}"

  lazbuild "${_pkgname}.lpi" --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config"
}

package() {
  cd "${srcdir}/transmisson-remote-gui-${pkgver}"

  install -D -m 755 "units/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/lang"
  install -D -m 644 lang/transgui.* "${pkgdir}/usr/share/${_pkgname}/lang"
  rm "${pkgdir}/usr/share/${_pkgname}/lang/transgui.template"

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m 644 readme.txt history.txt LICENSE.txt "${pkgdir}/usr/share/doc/${pkgname}"

  install -D -m 644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
