# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=wavebox-bin
pkgver=4.5.5
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss')
optdepends=('gvfs' 'libnotify' 'ttf-ms-fonts')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")

sha256sums=('ed71fff01f57bc7d4b32278b2fb5f33bb30057ed7aeee64b3696eb17dc4ba0fc')
sha256sums_x86_64=('b392e02b3b1b4deece32311aeb69b31c2550c4251be65f408c35b0badbf3c8b6')

package() {
  if [ ${CARCH} == "x86_64" ]; then
    cd ${srcdir}/Wavebox-linux-x64
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
