# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=crossdirstat
pkgname=${_pkgname}-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Free open-source cross-platform file & directory statistics"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'systemd-libs' 'dbus' 'gtk3' 'mesa' 'nspr' 'libxkbcommon' 'libxdamage' 'libxfixes' 'libxrandr' 'libxext' 'libxcb' 'expat' 'libx11' 'libxcomposite' 'libcups' 'alsa-lib' 'pango' 'cairo' 'nss' 'at-spi2-core' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('9ffb84335663022d32f9e84c6452994eda4823a502a690f8b0bc360a92a16974'
            '9fef6ed440edf791a1a0273af702e64805c86d762bec523f33552d6a35e60317')
sha256sums_x86_64=('24020b81bda4baa0eee5af2b251b3263cbd9ce2a02b961fb2fb8b96818a5b6ad')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  chmod 4755 "${pkgdir}/opt/Crossdirstat/chrome-sandbox"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Create a symlink to the binary in /opt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Crossdirstat/crossdirstat" "${pkgdir}/usr/bin/${_basename}"
} 
