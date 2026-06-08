pkgname=lug-wine-tkg-staging-experimental-git
pkgver=11.10
pkgrel=4
pkgdesc="Wine runner based on TKG builds + staging + experimental patches for Star Citizen"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=('wine' 'wine-staging' 'lug-wine-tkg-staging-experimental')
conflicts=('wine' 'wine-staging' 'lug-wine-tkg-staging-experimental' 'lug-wine-tkg-experimental-git' 'lug-wine-tkg-staging-experimental-wayland-git')

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
sha256sums=('349c72417a1383a5cc887770e2b11f30133e40c47ae7a13fa34eb40ff7399713')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}-1"/* "${pkgdir}/opt/${pkgname}/"

  # Create standard wine symlinks in /usr/bin/
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/wine" "${pkgdir}/usr/bin/wine"
  ln -s "/opt/${pkgname}/bin/wine64" "${pkgdir}/usr/bin/wine64"
  ln -s "/opt/${pkgname}/bin/winecfg" "${pkgdir}/usr/bin/winecfg"
  ln -s "/opt/${pkgname}/bin/wineserver" "${pkgdir}/usr/bin/wineserver"
  ln -s "/opt/${pkgname}/bin/wineboot" "${pkgdir}/usr/bin/wineboot"
}
