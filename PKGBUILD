# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=artemis
pkgname=${_pkgname}-bin
pkgver=4.0.3
pkgrel=1
pkgdesc="Radio Signals Recognition Manual"
url="https://aresvalley.com/"
arch=(x86_64)
license=(GPL3)
makedepends=(unzip)
source=("${_pkgname}-${pkgver}.zip::https://github.com/AresValley/Artemis/releases/download/v${pkgver}/Artemis-Linux-x86_64-${pkgver}.zip"
        "artemis.desktop")
sha256sums=('f586efaabae1e41fd09b4d1a3fb6037028cf7fbb18bcb7de218c9f56c8c53a64'
            '03f370b2595edd1f0ad0a6ea9172efb58956cc66a42d9d0da542e20223ad6f16')
noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
  cd "${srcdir}"

  unzip -d "preinstall" "${_pkgname}-${pkgver}.zip"
}

package() {
  cd "${srcdir}"

  # install basic stuff
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -ar "preinstall/." "${pkgdir}/opt/${_pkgname}"

  # fix permissions
  chown -R root:root "${pkgdir}/opt/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/app.bin"

  # install desktop entries and icons
  install -Dm644 "${srcdir}/preinstall/images/artemis_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/artemis.svg"
  install -Dm644 "${srcdir}/artemis.desktop" "${pkgdir}/usr/share/applications/artemis.desktop"

}
