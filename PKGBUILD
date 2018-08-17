# Maintainer: Alex Zappa <reatlat@gmail.com>
# Maintainer: Bernardo Kuri <aur@bkuri.com>

pkgname=wavebox-bin-beta
pkgver=3.14.14
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
sha512sums_x86_64=('fe3f1aced588ac8b76086f8c99fc52f8f7b5253dddc27718da3381625b75d2b9b5e0519e2164478e0b31e3c6706194aa6dc26ac497eb201c26d7c0b8989024a5')
sha512sums_i686=('e5de4640cf6b0ff32b5f9ddeb6918ec04a45ea76e1f036d91dfa3a9b8daf074dfe51c15648f8c9b9997301676f1027945c92aec82758e00bee6665a7214ce494')

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
