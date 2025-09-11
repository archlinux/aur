# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
pkgname=${_pkgname}-bin
pkgver=1.1.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Modern terminal app with SSH/SFTP support"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('dbus' 'libcups' 'cairo' 'mesa' 'glib2' 'libxrandr' 'libxfixes' 'libxcb' 'bash' 'libxcomposite' 'alsa-lib' 'expat' 'hicolor-icon-theme' 'glibc' 'nss' 'libxext' 'libxdamage' 'python' 'pango' 'libx11' 'gtk3' 'at-spi2-core' 'gcc-libs' 'nspr' 'libxkbcommon' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"

source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}.tar.gz"
  "${_pkgname}-${pkgver}.png::${_urlraw}/resources/icon.png"
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${pkgname}.install"
)
sha256sums=('d172ad76ab30e464c704a76638a21849809fb2f5de62512a46141e221ba4e81c'
            '05fa10722a11de98ad68c5ab0b63899e9732335209990dc76df006fe26f27800'
            '54de721847fb8607ebfc0985595e1e18dfa7dc656f5ca701f4d741a4a46febec'
            '713199d3cbc25fe611cb9b2e0c4bba00c85946dd8293be197661e9f4bdaee275'
            '6628d9ee715006d102c7b6fe8108ed6c755f71fa03e948b7f4d0842026645e97')


prepare() {
  echo """[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${_pkgname^}
Comment=Modern terminal app with SSH/SFTP support
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Utility;System;TerminalEmulator;""" > "${_pkgname}-${pkgver}.desktop"
}

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/kerminal-${pkgver}/"* "${pkgdir}/usr/lib/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -rs "${pkgdir}/usr/lib/${_pkgname}/${_pkgname^}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/kerminal-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "${srcdir}/kerminal-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
