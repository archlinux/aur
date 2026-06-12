# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=skillful-bin
pkgver=1.2.1
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
sha512sums=('a52c529b577ed343ac2a09ff7f0b0cae3f49b56fa32911f5f93b563b5638c8fb8ba937412dec61e66112643063ab1479ccc53211c5f5bf4faeed8ff22d1f7ddf'
            'cc6058556724a8a9429b6cf81440295a54a7a0776fc58fd35296c59ad4e0cfdc41a1a74f6077fe02e9234548633339698067ccce6b8d939c6a34a8d33f835400'
            'bfd22b49cb4a6fd48d07176176fc0730e1fcb9836c26363c7ff3fd750bd11d0b30ac1a8a5a9687e9266c476eac30dffd3bf93af40547364ef21181cbe714a6cb'
            '9dff410c111dbda70d2edff28a55d00fc2793dc3c06ac0d5b7cbbbe2806c227175a89fe0af2814db890a840ea0a9350d8ca323ba89f0b97b9faea78ee9549a11')
sha512sums_x86_64=('773d38a161724596c37c782c2b68dbf9f10d6dc05ea3c746e561bf87211d22a2f86de72897b28f03d54e412eacbdeb8bda9c5a763d24ac19d9008cf90e647d4b')

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
