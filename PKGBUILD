# Maintainer: Omansh Krishn omansh@duck.com

_pkgname=helixnotes
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='A local markdown note-taking app built with Tauri, SvelteKit, and Rust (deb version)'
arch=('x86_64')
url='https://codeberg.org/ArkHost/HelixNotes'
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
conflicts=("${_pkgname}")
options=(!debug)

source=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/HelixNotes_${pkgver}_amd64.deb")
sha256sums=('9e6826c0966da9b6735405e7363315a976a65ceae42ea2737cb2d80b8c2e39c7')

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
