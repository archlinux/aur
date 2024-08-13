# Maintainer: Milen <stefanov.m@ati.su>
_basename=time-desktop
_baseurl=https://time-apps.tinkoff.ru
pkgname=${_basename}-bin
pkgver=6.23.0
pkgrel=0
pkgdesc="TiMe (Tinkoff Messenger) is a corporate messenger based on Mattermost. This package provides the Linux desktop application."
arch=('x86_64')
url="${_baseurl}/production/on-premise/download-page/index.html"
license=('Apache License, Version 2.0')
depends=('glibc')
source=("${_baseurl}/production/on-premise/desktop/linux/time-desktop-linux-x64.tar.gz" "time.desktop")
sha256sums=('397494dc055e8426f29d3dfeef1e4635e671507cbc184c9f91d4fc680e17dc49'
            '858a3b5d784c0e9499c83e8d580695514206556e8dc4877f54a14e4aa7903111')

package() {
    install -d "${pkgdir}/opt/${_basename}"
    cp -r "${srcdir}/${_basename}-linux-x64/"* "${pkgdir}/opt/${_basename}/"
    
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_basename}/time-desktop" "${pkgdir}/usr/bin/time-desktop"
    
    install -Dm644 "${srcdir}/${_basename}-linux-x64/app_icon.png" "${pkgdir}/usr/share/pixmaps/time-desktop.png"
    install -Dm644 "${srcdir}/${_basename}-linux-x64/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
    
    install -Dm644 "${srcdir}/time.desktop" "${pkgdir}/usr/share/applications/time.desktop"
}

