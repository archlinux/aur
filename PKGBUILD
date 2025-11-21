# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=garlmap
pkgname=${_pkgname}-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Garlmap is the Gapless Almighty Rule-based Logical MPV Audio Player"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'systemd-libs' 'dbus' 'gtk3' 'mesa' 'nspr' 'libxkbcommon' 'libxdamage' 'libxfixes' 'libxrandr' 'libxext' 'libxcb' 'expat' 'libx11' 'libxcomposite' 'libcups' 'alsa-lib' 'pango' 'cairo' 'nss' 'at-spi2-core' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '0547289ad25f3abfd1003069685cb4ccbfb693459dad4d3a898b7050541eb16d')
sha256sums_x86_64=('98db995695fbe0a275652a92601e02f94777d6ef8d80534365d8e579661438d3')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  chmod 4755 "${pkgdir}/opt/Garlmap/chrome-sandbox"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Create a symlink to the binary in /opt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Garlmap/garlmap" "${pkgdir}/usr/bin/${_basename}"
} 
