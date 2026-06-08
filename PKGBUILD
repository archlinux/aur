pkgname=lug-wine-tkg-experimental-git
pkgver=11.10
pkgrel=2
pkgdesc="Wine runner based on TKG builds + experimental patches for Star Citizen"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=('lug-wine-tkg-experimental')
conflicts=('lug-wine-tkg-experimental')

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

source=("${pkgname}-${pkgver}-1.tar.gz::https://github.com/starcitizen-lug/lug-wine-experimental/releases/download/${pkgver}-1/${pkgname}-${pkgver}-1.tar.gz")
sha256sums=('1503cc2ee01942f2ef3d0b165a75b9480f7b20166877d940b040991c5b25ce12')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}-1"/* "${pkgdir}/opt/${pkgname}/"

  # Create symlinks in /usr/bin/ for system-wide CLI usage
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/wine" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/bin/wine64" "${pkgdir}/usr/bin/${pkgname}64"
  ln -s "/opt/${pkgname}/bin/winecfg" "${pkgdir}/usr/bin/${pkgname}-cfg"
  ln -s "/opt/${pkgname}/bin/wineserver" "${pkgdir}/usr/bin/${pkgname}-server"
  ln -s "/opt/${pkgname}/bin/wineboot" "${pkgdir}/usr/bin/${pkgname}-boot"
}
