# Maintainer: Ben Copeland <ben@copeland.me.uk>
pkgname=x16-prompt
pkgver=0.0.138
pkgrel=1
pkgdesc="16x Prompt (AppImage version) - an AI coding tool by 16x Engineer"
arch=('x86_64')
url="https://prompt.16x.engineer/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)

_appimage_name="16x+Prompt-${pkgver}.AppImage"
source=("${_appimage_name}::https://download.16x.engineer/16x+Prompt-${pkgver}.AppImage")
sha256sums=('6df64a6d219a93080f0fc06e81c7de00')

package() {
  install -d "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/${_appimage_name}" "${pkgdir}/opt/${pkgname}/16x-prompt"

  install -d "${pkgdir}/usr/local/bin"
  ln -s "/opt/${pkgname}/16x-prompt" "${pkgdir}/usr/local/bin/16x-prompt"

  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=16x Prompt
Comment=${pkgdesc}
Exec=/opt/${pkgname}/16x-prompt %U
Terminal=false
Type=Application
Icon=16x-prompt
Categories=Development;Utility;
StartupNotify=true
EOF

}
