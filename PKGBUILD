# Maintainer: Alif Rachmawadi <code@subosito.com>

pkgname=wavebox-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="The next generation of web-desktop communication"
arch=('x86_64' 'i686')
url="https://wavebox.io/"
_repourl="https://github.com/wavebox/waveboxapp"
license=('Mozilla Public License version 2.0')
options=(!strip)
provides=('wavebox')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss')
optdepends=('gvfs' 'libnotify')

source=('wavebox.desktop')
source_x86_64=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_${CARCH}.tar.gz")
source_i686=("${_repourl}/releases/download/v${pkgver}/Wavebox_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('a6a55a0b0597eea63e2869ab27e3ddab802b020c89059b0b32399b63e64f0271e4685e363448da71c6ba90c810b83542cd0c9f40e2ce49057a8e33c54b82663b')
sha512sums_x86_64=('52f2989943a576889eee18a577151d8ed13f54cbeceee2841f8634d3351268e48463fdcd1c1c39e8ffb76fbfda118bf6cc8b83af2f80bbe6deeb62e8a5108542')
sha512sums_i686=('15592efd13ac07c40f037c5d9666013da75e4b7377d861804252cf2d66591cc00e749ac1c9436f64d6c9150df7de1a1fe11bc8d8689e83e18cf8cd1b721b3df0')

package() {
  if [ ${CARCH} == "x86_64" ]; then
    cd ${srcdir}/Wavebox-linux-x64
  else
    cd ${srcdir}/Wavebox-linux-ia32
  fi

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/wavebox"
  mkdir -p "${pkgdir}/usr/share/applications"

  cp -R ./* "${pkgdir}/usr/share/wavebox"
  cp "${srcdir}/wavebox.desktop" "${pkgdir}/usr/share/applications/wavebox.desktop"
  ln -s "/usr/share/wavebox/Wavebox" "${pkgdir}/usr/bin/wavebox"
}
