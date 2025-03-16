# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=artemis
pkgname=${_pkgname}-bin
pkgver=4.1.0
pkgrel=2
pkgdesc="Radio Signals Recognition Manual"
url="https://aresvalley.com/"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(dbus gcc-libs glib2 glibc hicolor-icon-theme krb5 zlib zstd)
makedepends=(unzip)
source=("${_pkgname}-${pkgver}.zip::https://github.com/AresValley/Artemis/releases/download/v${pkgver}/Artemis-Linux-x86_64-${pkgver}.zip"
        "artemis.desktop")
sha256sums=('0f7b49044b0dfd11d077799fd8551ee35738dbcebf2408a1c922f78511b5c762'
            '03f370b2595edd1f0ad0a6ea9172efb58956cc66a42d9d0da542e20223ad6f16')
noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
  cd "${srcdir}"

  unzip -d "preinstall" "${_pkgname}-${pkgver}.zip"
}

package() {
  cd "${srcdir}"

  # install basic stuff
  mkdir -p "${pkgdir}/opt/artemis"
  cp -ar "preinstall/." "${pkgdir}/opt/artemis"

  # fix permissions
  chown -R root:root "${pkgdir}/opt/artemis"
  chmod 755 "${pkgdir}/opt/artemis/app.bin"

  # install desktop entries and icons
  install -Dm644 "${srcdir}/preinstall/images/artemis_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/artemis.svg"
  install -Dm644 "${srcdir}/artemis.desktop" "${pkgdir}/usr/share/applications/artemis.desktop"
}
