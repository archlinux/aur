# Maintainer: Zaros <kuzidiaolewc@outlook.com>
pkgname=obs-bilibili-stream-bin
_pkgname=obs-bilibili-stream
pkgver=2.0.12
pkgrel=1
pkgdesc="Bilibili stream plugin for OBS Studio (Binary version from Ubuntu .deb)"
arch=('x86_64')
url="https://github.com/Zarosmm/obs-bilibili-stream"
license=('GPL2')
depends=('obs-studio' 'curl' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/bilibili-stream-for-obs-${pkgver}-x86_64-ubuntu-24.04.deb")
sha256sums=('e95849f2ef017aa9e0db40f6127dd729a138af0aeb1e0a5551649ce647feaeeb')

package() {
  # makepkg will have extracted the .deb in the src directory,
  # resulting in data.tar.gz (or data.tar.zst) being present.
  
  # Create necessary directories
  install -d "${pkgdir}/usr/lib/obs-plugins"
  install -d "${pkgdir}/usr/share/obs/obs-plugins"

  # Extract the data archive
  if [ -f data.tar.gz ]; then
    bsdtar -xf data.tar.gz
  elif [ -f data.tar.zst ]; then
    bsdtar -xf data.tar.zst
  fi

  # Install the shared object to the correct Arch path
  # Note: The deb has it in usr/lib/x86_64-linux-gnu/obs-plugins/
  install -m755 usr/lib/x86_64-linux-gnu/obs-plugins/bilibili-stream-for-obs.so "${pkgdir}/usr/lib/obs-plugins/"

  # Install the data files
  cp -r usr/share/obs/obs-plugins/bilibili-stream-for-obs "${pkgdir}/usr/share/obs/obs-plugins/"
}
