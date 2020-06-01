# Maintainer: robertfoster

_pkgname=powder-player
pkgname=${_pkgname}-bin
pkgver=1.60
pkgrel=1
pkgdesc="Hybrid between a Torrent Client and a Player (torrent streaming)"
arch=('x86_64')
url="http://powder.media/"
license=('LGPL3')
provides=('powder-player')
conflicts=('powder-player')
options=('!strip')
install=${_pkgname}.install
source=("https://github.com/jaruba/PowderPlayer/releases/download/v$pkgver/PowderPlayer_v$pkgver.tar.gz"
    powder.desktop
    https://raw.githubusercontent.com/jaruba/PowderPlayer/react-polymer/images/icons/powder-icon.png
    libgconf-2.so.4.1.5
)
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
    
    # Add prebuilt libgconf taken from sid repo
    cp libgconf-2.so.4.1.5 "${pkgdir}/opt/${_pkgname}"
    ln -sr "${pkgdir}/opt/${_pkgname}/libgconf-2.so.4.1.5" "${pkgdir}/opt/${_pkgname}/libgconf-2.so.4"
    
    # Link to program
    ln -sr "/opt/${_pkgname}/Powder" "${pkgdir}/usr/bin/powder-player"
    chmod +x "${pkgdir}/opt/${_pkgname}/Powder"
    
    # Desktop file
    install -Dm644 powder.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 powder-icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

md5sums=('4d4dd407182fa00bec2c2ecbc7051f11'
    '40e4478fcfca9cfc32c2ae65279f35b8'
    '687feb9e0d2ce0395b455b85a39a0753'
'013af4b10c68b585e98f8ee760480bff')
