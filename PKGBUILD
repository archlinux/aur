# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Csubee <csubee@csubee.hu>
# Contributor: Neptune <neptune650@proton.me>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Saghm Rossi <aur@saghm.com>

pkgname=curseforge
pkgver=1.305.1_34041
pkgrel=1
pkgdesc="CurseForge desktop client for Linux"
arch=('x86_64')
depends=(
  dbus
  expat
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  systemd-libs
  zlib
)
url="https://curseforge.com"
license=('LicenseRef-overwolf' 'MIT' 'LicenseRef-chromium-licenses')
options=(!strip !debug)
source=(
  "CurseForge_${pkgver/_/-}_amd64.deb::https://curseforge.overwolf.com/electron/linux/CurseForge_${pkgver/_/-}_amd64.deb"
  'LICENSE'
)
sha256sums=('6a8d7e4ba21f106194a23bd6fbfdd5f3a9e590756939e2d4324d936012f8e3d4'
            '135c7ffeb81f4a7ee95a5879651b679e0d1ef9d13c7aa7c262386ad97b48d62f')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  mv "${pkgdir}/opt/CurseForge" "${pkgdir}/opt/${pkgname}"

  sed -i "s:/opt/CurseForge:/opt/${pkgname}:" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/CURSEFORGE-LICENSE"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
