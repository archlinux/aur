# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

_pkgname='transgui'
_ws='gtk2'
pkgname='transmission-remote-gui-gtk2'
pkgver='5.17.0'
pkgrel=1
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=('i686' 'x86_64')
url='https://github.com/leonsoft-kras/transmisson-remote-gui'
license=('GPL2')
depends=('gtk2')
makedepends=('lazarus')
provides=('transmission-remote-gui')
conflicts=('transmission-remote-gui-gtk2' 'transmission-remote-gui-qt4'
           'transmission-remote-gui-svn' 'transmission-remote-gui')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/leonsoft-kras/${pkgname%%-gtk2}/archive/v${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('c3d5378f8b6be64c3fefab77eecd86b5357dfd9dbb941bd620b6083ae350417f'
            'eff1a22b1dad72528f2200eafcec6df411ff7231d199889b08e730256fcae81c')

build() {
  cd "${_pkgname}-${pkgver}"

  lazbuild "${_pkgname}.lpi" --verbose --lazarusdir=/usr/lib/lazarus --widgetset=${_ws}
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -D -m 755 "units/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/lang"
  install -D -m 644 lang/transgui.* "${pkgdir}/usr/share/${_pkgname}/lang"
  rm "${pkgdir}/usr/share/${_pkgname}/lang/transgui.template"

  install -d -m 755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m 644 README.md history.txt LICENSE \
    "${pkgdir}/usr/share/doc/${_pkgname}"

  install -D -m 644 "${_pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
