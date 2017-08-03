# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=wavebox-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64' 'i686')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss' 'libappindicator-gtk2')
optdepends=('gvfs' 'libnotify')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('a6a55a0b0597eea63e2869ab27e3ddab802b020c89059b0b32399b63e64f0271e4685e363448da71c6ba90c810b83542cd0c9f40e2ce49057a8e33c54b82663b')
sha512sums_x86_64=('346b74a3b4e22dd9e999e638dd9418d5b8aa8b1503457351f8d595fa0480514724bc1a641965c935c096d82b6aaab8c9ba6c809db1bbc69e98b86c476897ef8f')
sha512sums_i686=('eb3e6aba12f4c7c9d9563a126c1b96e1290fc3b55855310bd83c13524e5473ab48808d50d763fd3bdfadac21a21269092704b7f276c263b520355d0064cf75ac')

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
