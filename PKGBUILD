# Maintainer: Alex Zappa <reatlat@gmail.com>

pkgname=wavebox-bin-beta
pkgver=3.6.1
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64' 'i686')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
conflicts=('wavebox-bin')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss' 'libappindicator-gtk2')
optdepends=('gvfs' 'libnotify')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('a6a55a0b0597eea63e2869ab27e3ddab802b020c89059b0b32399b63e64f0271e4685e363448da71c6ba90c810b83542cd0c9f40e2ce49057a8e33c54b82663b')
sha512sums_x86_64=('63cbe73da5b7475a40bfa0b0ff6e60f2ebf4ec9af5f1d29a8fc536348cfdf870f45e9a100bb656b1ab99363f9aae068d9fd9767e12efa5241ebbc09cc0358ee3')
sha512sums_i686=('1f3866a859fc80a2160d3ef89908556d70e00bbedff1e71e57a70679e2a0ca6b23ab7fa2b72252f54d0f7d85e70c1479e07a53d2b344b861ef24ee7dae3a7e08')

package() {
  if [ ${CARCH} == "x86_64" ]; then
    cd ${srcdir}/Wavebox-linux-x64
  else
    cd ${srcdir}/Wavebox-linux-ia32
  fi

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/wavebox"
  mkdir -p "${pkgdir}/usr/share/applications"

  cp --preserve=mode -R ./* "${pkgdir}/usr/share/wavebox"
  install -m644 "${srcdir}/wavebox.desktop" "${pkgdir}/usr/share/applications/wavebox.desktop"
  ln -s "/usr/share/wavebox/Wavebox" "${pkgdir}/usr/bin/wavebox"

  chmod 644 "${pkgdir}/usr/share/wavebox/wavebox_icon.png"
  chmod 644 "${pkgdir}/usr/share/wavebox/libnode.so"
}
