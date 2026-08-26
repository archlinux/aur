# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=crossdirstat
pkgname=${_pkgname}-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Free open-source cross-platform file & directory statistics"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'glib2' 'systemd-libs' 'dbus' 'gtk3' 'mesa' 'nspr' 'libxkbcommon' 'libxdamage' 'libxfixes' 'libxrandr' 'libxext' 'libxcb' 'expat' 'libx11' 'libxcomposite' 'libcups' 'alsa-lib' 'pango' 'cairo' 'nss' 'at-spi2-core' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('09af59efad3c9931c83b1eba5045beb2d4de0693787b2dc59cd13686c06fcb2e'
            'ae80001123f55ad492ab414089b9adb71d91d4b7735d51332b3d9a285ed62501')
sha256sums_x86_64=('14ae2144da59120af2f40f5672902fa457315cf3adf172619e3bd2a2b799c9da')

package() {
  cd "${srcdir}"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  # Create a symlink to the binary in /opt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Crossdirstat/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
