# Maintainer: Alex Zappa <reatlat@gmail.com>

pkgname=wavebox-bin-beta
pkgver=3.2.6
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
sha512sums_x86_64=('e6e7e685301bfbfc0ddfa1c78056b787fdaef70cdc91015388adb9c8b8cc187e40b83b28c1aecbe55d0c91eedac9904feb620906993a91a6e423e68e466f172b')
sha512sums_i686=('25ea060ecd945cd56988be0d874fbddd397dd85803553497eaf9321fcadf4030dd2430343662bb85433862bd79b93e97640bea38be0f4861238def69899e0038')

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
