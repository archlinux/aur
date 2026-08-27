# Maintainer: Omansh Krishn omansh@duck.com

_pkgname=helixnotes
pkgname=${_pkgname}-bin
pkgver=1.3.5
pkgrel=1
pkgdesc='A local, open-source Markdown note-taking app. No cloud, no account, no telemetry. (deb version)'
arch=('x86_64')
url='https://gitlab.com/ArkHost/HelixNotes'
license=('AGPL3')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libsoup3'
    'glib2'
    'cairo'
    'gdk-pixbuf2'
    'gcc-libs'
    'glibc'
    'libsecret'
    'libdrm'
)
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "helixnotes-appimage-bin")
options=(!debug)

source=("${_pkgname}-${pkgver}-x86_64.deb::https://download.helixnotes.com/releases/v${pkgver}/HelixNotes_${pkgver}_amd64.deb")
sha256sums=('01966095b442aff81d9040a3c950d7affee9f67982bc8efa4341566a061efa06')

package() {

  cd "${srcdir}"
  tar -xzf "${srcdir}/data.tar.gz"
  
  install -dm755 "${pkgdir}/usr/bin"
  install -m755  "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"


  for size in 32x32 128x128 256x256@2; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/usr/share/applications/HelixNotes.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
