# Maintainer: Alex Zappa <reatlat@gmail.com>
# Maintainer: Bernardo Kuri <aur@bkuri.com>

pkgname=wavebox-bin-beta
pkgver=4.5.6
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
#arch=('x86_64' 'i686')
arch=('x86_64')
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
sha512sums_x86_64=('5a2193ada123bfd96602392b0272cdc03b74ba1b99d4a96626760976f59314a26d74eb3ef5ab581cf89def7ffbe4ee331a3bafccfd93473ca90587e21cebaec2')
sha512sums_i686=('')

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
