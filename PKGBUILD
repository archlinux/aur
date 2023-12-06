# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lalalai
pkgname=${_pkgname}
pkgdesc="Vocal remover and instrumental AI splitter"
pkgver=1.3.2
_pkgrel=1
pkgrel=${_pkgrel}
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://www.lalal.ai/"
arch=("x86_64")
license=("freeware-proprietary")
_pkg="lalalai_${pkgver}-1_amd64.deb"
source=($_pkg::"https://d.lalal.ai/app/${_pkg}?source=aur"
        "https://s.lalal.ai/icons/favicon.svg"
        "lalalai.desktop")
sha1sums=('67e54bacb2c0cfd96ebe95b4119d8b7ab0692f58'
          '7f7c41c602bd20340bc79be3e73c364fcb774d73'
          '0879c6471548fda937e5bc28ae867f98ce1c3b9e')
options=(!strip)

prepare() {
  mkdir -p control
  tar -xf data.tar.xz
  sed -i -E "s:/usr/lib/:/opt/:" "usr/lib/${_pkgname}/${_pkgname}.sh"
}

package() {
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt" "${pkgdir}/usr/share/pixmaps" \
  "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "favicon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${provides}.svg"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  mv "usr/lib/${_pkgname}" "${pkgdir}/opt/"
  mv "usr/share/doc/${_pkgname}/"* "${pkgdir}/usr/share/licenses/${_pkgname}/"
  ln -sf "/opt/${_pkgname}/lalalai.sh" "${pkgdir}/usr/bin/${provides}"
}
