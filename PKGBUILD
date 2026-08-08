# Maintainer: MrRedstonia <contact@mrredstonia.com>
pkgname=armbian-imager-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Utility for flashing Armbian OS images to SD cards and USB drives."
arch=('x86_64')
url="https://armbian.com/"
license=('GPL-2.0')
depends=('cairo' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('binutils' 'tar')
provides=('armbian-imager')
conflicts=('armbian-imager')
options=('!strip')

source=("https://github.com/armbian/imager/releases/download/v${pkgver}/Armbian.Imager_${pkgver}_amd64.deb")
sha256sums=('733c3ff72c123ab09728b588d3a4277c67cadb982f064743b58efe67fd167d3d')

prepare() {
  ar x "Armbian.Imager_${pkgver}_amd64.deb"
  
  tar -xf data.tar.*
}

package() {
  cp -a usr "${pkgdir}/"

  if [ -d "opt" ]; then
    cp -a opt "${pkgdir}/"
  fi

  local desktop_file="${pkgdir}/usr/share/applications/Armbian Imager.desktop"
  if [ -f "${desktop_file}" ]; then
    sed -i 's/^Exec=/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' "${desktop_file}"
  fi
}
