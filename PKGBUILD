pkgname=transmission-remote-gui
_pkgname=transgui
pkgver=5.16.0
pkgrel=1
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=('i686' 'x86_64')
url='https://github.com/leonsoft-kras/transmisson-remote-gui'
license=('GPL2')
depends=('qt4pas')
makedepends=('lazarus')
conflicts=('transmission-remote-gui-bin')
source=(https://github.com/leonsoft-kras/transmisson-remote-gui/archive/v${pkgver}.zip
        ${_pkgname}.desktop)
sha1sums=('ef4e559b277b4130459a83762798519d2c1fb11c'
          'df16780ed1f875b316e3e2e6d01dc4e886281d60')

build() {
  mkdir -p "${srcdir}/config"
  cd "${srcdir}/${_pkgname}-${pkgver}"

  lazbuild "${_pkgname}.lpi" --lazarusdir=/usr/lib/lazarus --widgetset=qt \
    --primary-config-path="${srcdir}/config"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m 755 "units/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/lang"
  install -D -m 644 lang/transgui.* "${pkgdir}/usr/share/${_pkgname}/lang"
  rm "${pkgdir}/usr/share/${_pkgname}/lang/transgui.template"

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m 644 README.md history.txt LICENSE "${pkgdir}/usr/share/doc/${pkgname}"

  install -D -m 644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
