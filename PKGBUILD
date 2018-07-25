# Maintainer: Alex Zappa <reatlat@gmail.com>
# Maintainer: Bernardo Kuri <aur@bkuri.com>

pkgname=wavebox-bin-beta
pkgver=3.14.8
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
optdepends=('gvfs' 'libnotify' 'ttf-ms-fonts')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('c0859fb30dc9dab6f2584568f7f1012fb5f0b35488b4b7d0fb8034469796a290a6b6c6de9c0bc5d22d3566f444e14fbae593fdef7f725e51b89217a9f62cd407')
sha512sums_x86_64=('322b731fab60d8d24bec92694f2cd93fa63ec0a584601aac43d4cfb890cdf66a911475d9b2946aa606a2e1f34f942b41c4345ce98f2d840f7bbe1c3fc4a54884')
sha512sums_i686=('dae1dbc53d00297f37ba97bca6fcfb6f686e791de1cae8380501e5161a19ebf4386deb9a1a78d6440c1a76f65ce99d2502708687b6f5f5208d946ebc31c220eb')

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
