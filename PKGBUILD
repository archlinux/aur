# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy-bin
_pkgname="${pkgname/-bin}"
pkgver=2024.5
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('halloy')
conflicts=('halloy')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('deca13ebdc04657fd463ba1a1fb115fee822ee974cd4affaf61a4c3c6d6b4319')

package() {
  install -Dm755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # cp -r "share" "${pkgdir}/usr"
  install -Dm755 "${srcdir}/share/applications/org.squidowl.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm755 "${srcdir}/share/metainfo/org.squidowl.${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"

  for dir in $(ls "${srcdir}/share/icons/hicolor")
  do
  install -Dm755 "${srcdir}/share/icons/hicolor/${dir}/apps/org.squidowl.${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${dir}/apps/"
  done
}
