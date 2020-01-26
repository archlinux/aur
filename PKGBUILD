# Maintainer: robertfoster

_pkgname=powder-player
pkgname=${_pkgname}-bin
pkgver=1.55
pkgrel=1
pkgdesc="Hybrid between a Torrent Client and a Player (torrent streaming)"
arch=('x86_64')
url="http://powder.media/"
license=('LGPL3')
depends=('gconf')
provides=('powder-player')
conflicts=('powder-player')
options=('!strip')
install=${_pkgname}.install
source=("https://github.com/jaruba/PowderPlayer/releases/download/v$pkgver/PowderPlayer_v$pkgver.tar.gz"
	powder.desktop
	https://raw.githubusercontent.com/jaruba/PowderPlayer/react-polymer/images/icons/powder-icon.png)
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
  ln -sr "/opt/${_pkgname}/Powder" "${pkgdir}/usr/bin/powder-player"
  chmod +x "${pkgdir}/opt/${_pkgname}/Powder"

  # Desktop file
  install -Dm644 powder.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 powder-icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

md5sums=('0da0414a5ff24570d96704c4ed5202b3'
         '40e4478fcfca9cfc32c2ae65279f35b8'
         '687feb9e0d2ce0395b455b85a39a0753')
