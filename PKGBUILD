# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lalalai
pkgname=${_pkgname}
pkgdesc="Vocal remover and instrumental AI splitter"
pkgver=2.9.1
pkgrel=2
arch=("x86_64")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://www.lalal.ai/"
license=("freeware-proprietary")
depends=('libmediainfo' 'libcurl-gnutls')
_sparkle=2.9.1.158
_pkg="lalalai_${_sparkle}-1_amd64.deb"
source=($_pkg::"https://d.lalal.ai/app/${_pkg}?source=aur"
        "${_pkgname}.desktop")
sha1sums=('0b24966f90c66231ce0dc04ff1559070ad8ec295'
          '8a9bb46e43e65ed1dd427de04fdb432904256b84')
options=(!strip)

prepare() {
  tar -xf data.tar.xz
}

package() {
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/share/icons/hicolor/"{128x128,256x256}"/apps" \
  "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "usr/share/icons/hicolor/128x128/apps/lalalai.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/lalalai.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm755 "usr/share/${_pkgname}/${_pkgname}-bin" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  mv "usr/share/${_pkgname}/"{data,lib} "${pkgdir}/opt/${_pkgname}/"
  mv "usr/share/${_pkgname}/"*.txt "${pkgdir}/usr/share/licenses/${_pkgname}/"
  ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${provides}"
}
