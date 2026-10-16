# Maintainer: Omansh Krishn omansh@duck.com

_pkgname=privacynotes
pkgname=${_pkgname}-bin
pkgver=0.653.1
pkgrel=1
pkgdesc='End-to-end encrypted notes, tasks, files, passwords, journal and bookmarks. (deb version)'
arch=('x86_64' 'aarch64')
url='https://github.com/LifetimeLabsDev/PrivacyNotes.app'
license=('AGPL-3.0-only')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)

provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-appimage-bin")
options=(!debug)

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/PrivacyNotes_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/PrivacyNotes_${pkgver}_arm64.deb")
sha256sums_x86_64=('507134001fbb11d625eab2b58d351f9cf1fc896a60df1d379f78a21539e120d2')
sha256sums_aarch64=('04efe6e92868b20004bb0d854181c1ac14273ec719104d6747d328a6f24dbd36')

package() {

  cd "${srcdir}"
  tar -xzf "${srcdir}/data.tar.gz"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755  "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"


  for size in 32x32 128x128 256x256@2 512x512; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/usr/share/applications/PrivacyNotes.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/metainfo"
  install -Dm644 "${srcdir}/usr/share/metainfo/app.${_pkgname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/app.${_pkgname}.metainfo.xml"

}
