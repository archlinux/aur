# Maintainer: MrRedstonia <contact@mrredstonia.com>
pkgname=armbian-imager-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Utility for flashing Armbian OS images to SD cards and USB drives."
arch=('x86_64')
url="https://github.com/armbian/imager"
license=('GPL-2.0-or-later')
depends=('cairo' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
provides=('armbian-imager')
conflicts=('armbian-imager')
options=('!strip')

source=("https://github.com/armbian/imager/releases/download/v${pkgver}/Armbian.Imager_${pkgver}_amd64.deb")
sha256sums=('2b96b9360da5b64f555638b6893b22c13d761d5d015633c6429792501fb4d6f6')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"

  local desktop_file="${pkgdir}/usr/share/applications/Armbian Imager.desktop"
  if [ -f "${desktop_file}" ]; then
    sed -i 's/^Exec=/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /' "${desktop_file}"
  fi
}
