# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-app-dev-bin
pkgver=0.4.0.dev.41f5c45
pkgrel=1
pkgdesc="Omawarden desktop app for Bitwarden/Vaultwarden (development build)"
arch=('x86_64' 'aarch64')
url="https://github.com/omawarden/omawarden-app"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libsecret' 'polkit' 'wl-clipboard')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
provides=('omawarden-app')
conflicts=('omawarden-app')
install='omawarden-policy.install'
source_x86_64=("omawarden-app-x86_64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('411a0eab3f24457a401f310a8708080db400c2f83cb55c14e76b2904e6bae26c')
source_aarch64=("omawarden-app-aarch64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('5864603d6f658af2965ac2b010a9eba889202e968d0fc4793e0c227c0d2b8721')

package() {
  local appdir
  appdir=$(find "${srcdir}" -maxdepth 1 -type d -name 'omawarden-app-*' | head -n 1)
  if [[ -z "${appdir}" ]]; then
    error "omawarden-app package directory not found"
  fi

  install -Dm755 "${appdir}/omawardenApp" "${pkgdir}/usr/lib/omawarden-app/omawardenApp"
  cp -a "${appdir}/nsh" "${pkgdir}/usr/lib/omawarden-app/nsh"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/omawarden-app/omawardenApp "${pkgdir}/usr/bin/omawardenApp"

  install -Dm644 "${appdir}/com.icyleaf.omawarden.desktop"     "${pkgdir}/usr/share/applications/com.icyleaf.omawarden.desktop"
  install -Dm644 "${appdir}/com.icyleaf.omawarden.png"     "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/com.icyleaf.omawarden.png"
  install -Dm644 "${appdir}/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"     "${pkgdir}/usr/share/polkit-1/actions/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"
  install -Dm644 "${appdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
