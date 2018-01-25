# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=wavebox-bin
pkgver=3.10.0
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64' 'i686')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss' 'libappindicator-gtk2')
optdepends=('gvfs' 'libnotify' 'ttf-ms-fonts')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('c0859fb30dc9dab6f2584568f7f1012fb5f0b35488b4b7d0fb8034469796a290a6b6c6de9c0bc5d22d3566f444e14fbae593fdef7f725e51b89217a9f62cd407')
sha512sums_x86_64=('5bbba70f6f368e10b391429bea734cb53c5cd12294a89737e9c7347eb5a32fa013a0d6cc756f50f6347131e6267637108f3401cb460624db581e85d720df6ea4')
sha512sums_i686=('b1732479ec344c9d0a451312db7120db008bc69d5df57d0b851803d8e6fdb706d565e81cebf419359269d428e6f13f4116f82b9a1b46ce6864d317cb23a47e8c')

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
