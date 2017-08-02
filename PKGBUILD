# Maintainer: Alex Zappa <reatlat@gmail.com>

pkgname=wavebox-bin-beta
pkgver=3.2.1
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
sha512sums_x86_64=('0a9d7968a2a8295c00d0c126830f653ee00f5967326832eef2c32746311ea49af250baa7af0e79486587e4387cd8791b87d5fffc5724489b7fee505d4af9c6e5')
sha512sums_i686=('a9b193dd53cdbb346442935c6da0c534533ff7406cc8dacf6eaf3d4fb2cfd8d38da90bd8693499085516bddd173e7fc0e02e58dfb0a789ebe7df2311e85fc169')

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

  chmod 644 "${pkgdir}/usr/share/wavebox/icon.png"
  chmod 644 "${pkgdir}/usr/share/wavebox/libnode.so"
}
