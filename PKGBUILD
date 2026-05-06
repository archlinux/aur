pkgname=cockpit-tools-appimage
_pkgname='Cockpit.Tools'
pkgver=0.22.20
pkgrel=1
pkgdesc='Universal AI IDE account manager repackaged from the upstream AppImage release'
arch=('x86_64')
url='https://github.com/ark3us/cockpit-tools'
license=('CC-BY-NC-SA-4.0')
depends=('fuse2')
provides=('cockpit-tools')
conflicts=('cockpit-tools' 'cockpit-tools-bin')
options=(!strip)
source=(
  "${_pkgname}_${pkgver}_amd64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
  'cockpit-tools.desktop'
  "cockpit-tools.png::${url}/raw/v${pkgver}/src-tauri/icons/512x512.png"
)
sha256sums=('857384834d1938ebc9c963cd57070915f3f7ea3ed9a35886383eb4a9dcb55222'
            '917d28f2ce5770ff23d87e493173e4ca770697251e3f948bfa53a993d792397a'
            'b7a6b0237cd752ee3829271557557b839b3e0a92a6bfd8f7c22b36a591077f49')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 \
    "${srcdir}/${_pkgname}_${pkgver}_amd64.AppImage" \
    "${pkgdir}/opt/${pkgname}/cockpit-tools.AppImage"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/cockpit-tools" <<'WRAPPER'
#!/bin/sh
exec /opt/cockpit-tools-appimage/cockpit-tools.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/cockpit-tools"

  install -Dm644 "${srcdir}/cockpit-tools.desktop" "${pkgdir}/usr/share/applications/cockpit-tools.desktop"
  install -Dm644 "${srcdir}/cockpit-tools.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cockpit-tools.png"
}
