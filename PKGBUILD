# Maintainer: M0Rf30

_pkgname=powder-player
pkgname=${_pkgname}-bin
pkgver=1.00
pkgrel=1
pkgdesc="Hybrid between a Torrent Client and a Player (torrent streaming)"
arch=('x86_64')
url="http://powder.media/"
license=('LGPL3')
depends=()
optdepends=()
provides=('powder-player')
conflicts=('powder-player')
options=('!strip')
install=${_pkgname}.install
source=("http://powder.media/nightly/PowderPlayer_v$pkgver.tar.gz"
	#"https://github.com/jaruba/PowderPlayer/releases/download/v$pkgver/PowderPlayer_v$pkgver.tar.gz"
	powder.desktop)

package() {
  cd "${srcdir}"

  # Fix permissions
  find . -type d -exec chmod 755 {} \; 
  find . -type f -exec chmod 644 {} \;

  install -dm755 "${pkgdir}/opt/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program

  cp -r PowderPlayer "${pkgdir}/opt/${_pkgname}/"
  
  # Link to program
  ln -sr "/opt/${_pkgname}/Powder" "${pkgdir}/usr/bin/powder"
  chmod +x "${pkgdir}/opt/${_pkgname}/Powder"

  # Desktop file
  install -Dm644 powder.desktop "${pkgdir}/usr/share/applications/powder.desktop"
}

md5sums=('SKIP'
         '66421e98741918dad1c48038aa6db2e5')
