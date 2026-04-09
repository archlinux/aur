# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

_pkgname=vieb
pkgname=${_pkgname}-bin
pkgver=12.8.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'gtk3' 'glib2' 'libx11' 'libxext' 'libxkbcommon' 'libxcb' 'pango' 'libxcomposite' 'nss' 'expat' 'systemd-libs' 'alsa-lib' 'nspr' 'at-spi2-core' 'cairo' 'libxfixes' 'libxrandr' 'mesa' 'libxdamage' 'libcups' 'dbus' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha512sums=('d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            'cf7d9da7cdf7e26515a78c09cd4c7a864b53ae3299b77e6f112052e3cc642a40a0c50e83198eb19df0866f6b79da9e0e26e3650985ce7056d8961d7059119225')
sha512sums_x86_64=('4434a2a201622a508eaef4e2e35e6af4ca3003d9c658abf43ff5b04975b052a0cbdcdf5b7583129d72bf4449056b684607701a865d5258586c7ee9e826dd6a65')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  chmod 4755 "${pkgdir}/opt/Vieb/chrome-sandbox"

  # Create a symlink to the binary in /opt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Vieb/vieb" "${pkgdir}/usr/bin/${_pkgname}"
}
