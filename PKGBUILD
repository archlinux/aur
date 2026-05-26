# Maintainer: Darko Luketic <info at icod dot de>

pkgname=antigravity2-bin
_pkgname=antigravity2
pkgver=2.0.6
_build=5413878570549248
pkgrel=1
pkgdesc='Google Antigravity - Agentic Desktop Application'
arch=('x86_64' 'aarch64')
url='https://antigravity.google'
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
optdepends=(
  'xdg-utils: open URLs and files from the desktop app'
  'org.freedesktop.secrets: store credentials in a desktop keyring'
)
provides=('antigravity2' 'antigravity')
conflicts=('antigravity2' 'antigravity')
options=('!strip' '!debug')
source=(
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
source_x86_64=(
  "Antigravity-${pkgver}-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_build}/linux-x64/Antigravity.tar.gz"
)
source_aarch64=(
  "Antigravity-${pkgver}-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_build}/linux-arm/Antigravity.tar.gz"
)
sha256sums=(
  '8bd61275845713a7bb0386b3e9a035fc6e12b6beb975e5500d173a1b9bf6d0ea'
  '6c65d2b53cc056539ad761b8f4d3c1bc484c853972ae5b1708c219c1153a4753'
  'b27f0e4a6f14f491ba31bb24533a1f43c677362b12a0744a53fdd09d7c785317'
)
sha256sums_x86_64=(
  'ad1e04535149b07c27030eb1ead40f4efda388cb39020bcbb9accdfb49e44cc5'
)
sha256sums_aarch64=(
  '02fc7f47650582ac72b845853b514de6c83ea7a4cd8a8d739e1a8688db2f45a9'
)

package() {
  case "${CARCH}" in
    x86_64)
      _archive_dir='Antigravity-x64'
      ;;
    aarch64)
      _archive_dir='Antigravity-arm64'
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/${_archive_dir}/." "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
}
