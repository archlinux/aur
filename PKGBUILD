# Maintainer: Gian

pkgname=cockpit-tools-appimage
_pkgname=Cockpit.Tools
pkgver=0.19.2
pkgrel=1
pkgdesc='Universal AI IDE account manager repackaged from the upstream AppImage release'
arch=('x86_64' 'aarch64')
url='https://github.com/jlcodes99/cockpit-tools'
license=('LicenseRef-CC-BY-NC-SA-4.0')
depends=()
options=(!strip)
source_x86_64=(
  "${_pkgname}_${pkgver}_amd64.AppImage::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
  'cockpit-tools.desktop'
  'LICENSE-CC-BY-NC-SA-4.0.txt'
  'cockpit-tools.png'
)
source_aarch64=(
  "${_pkgname}_${pkgver}_aarch64.AppImage::https://github.com/jlcodes99/cockpit-tools/releases/download/v${pkgver}/${_pkgname}_${pkgver}_aarch64.AppImage"
  'cockpit-tools.desktop'
  'LICENSE-CC-BY-NC-SA-4.0.txt'
  'cockpit-tools.png'
)
sha256sums_x86_64=('2ad288d940dd1ef3fedfd466cc9ca686fe56c2a24f2df928e67a3bdbcb036206'
                   '3061937fe6ba4c054dab38c349db7f8b5359226ff8c6ed0e1d60d2ffc65bf510'
                   'e66c269d4819aaab34b49ef5220c4ddab6756f21bb5180761a4eb8561f2b7bbd'
                   'adf31f26511a09fd60f76e099fd13e4761880138bb942153046c2ce261a9071c')
sha256sums_aarch64=('cee2083113ede11764e48eeee2ffac065ae6599041e5298b785ebeccc5173be8'
                    '3061937fe6ba4c054dab38c349db7f8b5359226ff8c6ed0e1d60d2ffc65bf510'
                    'e66c269d4819aaab34b49ef5220c4ddab6756f21bb5180761a4eb8561f2b7bbd'
                    'adf31f26511a09fd60f76e099fd13e4761880138bb942153046c2ce261a9071c')

package() {
  local _appimage
  case "$CARCH" in
    x86_64)
      _appimage="${srcdir}/${_pkgname}_${pkgver}_amd64.AppImage"
      ;;
    aarch64)
      _appimage="${srcdir}/${_pkgname}_${pkgver}_aarch64.AppImage"
      ;;
  esac

  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/cockpit-tools.AppImage"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/cockpit-tools" <<'WRAPPER'
#!/bin/sh
exec /opt/cockpit-tools-appimage/cockpit-tools.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/cockpit-tools"

  install -Dm644 "${srcdir}/cockpit-tools.desktop" "${pkgdir}/usr/share/applications/cockpit-tools.desktop"
  install -Dm644 "${srcdir}/cockpit-tools.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cockpit-tools.png"
  install -Dm644 "${srcdir}/LICENSE-CC-BY-NC-SA-4.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
