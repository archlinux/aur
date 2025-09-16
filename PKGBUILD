# Maintainer: cafreo
pkgname=wealthfolio-bin
_pkgname=Wealthfolio
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="A Beautiful and Boring Investment Tracker, with Local Data Storage. No Subscriptions, No Cloud."
arch=('x86_64')
url="https://wealthfolio.app/"
license=('AGPL-3.0')
groups=()
depends=('curl' 'wget' 'webkit2gtk' 'gtk3' 'webkit2gtk-4.1')
makedepends=()
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/afadil/${pkgname%-bin}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
_deb="${_pkgname}_${pkgver}_amd64.deb"
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "${srcdir}"
    tar -zxvf data.tar.gz
    sed -i "s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
  # bin
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # desktop file
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # icon images
  _icon_sizes=(32x32 128x128 256x256@2)
  for _icons in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
  done 
}
