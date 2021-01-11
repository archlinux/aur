# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

_pkgname=orca

pkgname=plotly-"${_pkgname}"-appimage
pkgver=1.3.1
pkgrel=2
pkgdesc="Command line application for generating static images of interactive plotly charts"
arch=('x86_64')
url="https://github.com/plotly/orca"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source=(
  ${url}/releases/download/v${pkgver}/${_appimage}
  ${url}/raw/v${pkgver}/LICENSE
)
#https://github.com/plotly/orca/releases/download/v1.3.1/orca-1.3.1.AppImage
noextract=("${_appimage}")
sha512sums=(
  '94a34b29041c973656730b2265f7b1fd9d1f449eddd605eb1b27d733ac3edc05ccafdf6dc915d7ce3c093be19a96d9d8aa35b8513c71ab2ebab10f658906e5c2'
  'SKIP'
)

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
    # License
    install -Dm644 LICENSE "${pkgdir}/opt/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

