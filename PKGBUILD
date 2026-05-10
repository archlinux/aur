# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=skillful-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop app for managing local AI skills and agents as folders on disk"
arch=(x86_64)
url="https://skillful.md"
license=('custom:FSL-1.1-MIT')
depends=(gtk3 nss libxss libnotify libappindicator-gtk3 xdg-utils)
provides=(skillful)
conflicts=(skillful)
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Mastermindzh/skillful/v${pkgver}/LICENSE"
  "skillful.desktop"
  "skillful.png::https://raw.githubusercontent.com/Mastermindzh/skillful/v${pkgver}/assets/icons/linux/512x512.png"
  "tech.mastermindzh.skillful.metainfo.xml::https://raw.githubusercontent.com/Mastermindzh/skillful/v${pkgver}/assets/metainfo/tech.mastermindzh.skillful.metainfo.xml"
)
source_x86_64=("skillful-${pkgver}-linux-x64.tar.gz::https://github.com/Mastermindzh/skillful/releases/download/v${pkgver}/skillful-${pkgver}-linux-x64.tar.gz")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha512sums_x86_64=('SKIP')

package() {
  install -d "${pkgdir}/opt/skillful" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/skillful/"

  chmod +x "${pkgdir}/opt/skillful/skillful"
  ln -s "/opt/skillful/skillful" "${pkgdir}/usr/bin/skillful"

  install -Dm644 "${srcdir}/skillful.desktop" "${pkgdir}/usr/share/applications/skillful.desktop"
  install -Dm644 "${srcdir}/skillful.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/skillful.png"
  install -Dm644 "${srcdir}/skillful.png" "${pkgdir}/usr/share/pixmaps/skillful.png"
  install -Dm644 "${srcdir}/tech.mastermindzh.skillful.metainfo.xml" "${pkgdir}/usr/share/metainfo/tech.mastermindzh.skillful.metainfo.xml"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -s "/opt/skillful/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "/opt/skillful/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
