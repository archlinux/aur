# Maintainer: <ian.k.armstrong at gmail dot com>

_appname=bibliasacra
pkgname=${_appname}-appimage
pkgver=1.0.7
pkgrel=1
pkgdesc="A Flutter Bible application with English and Latin versions"
arch=('x86_64')
license=('GPLv3')
depends=('xdg-utils')
url="https://github.com/ika/Biblia_Sacra"
provides=('bibliasacra')
conflicts=('bibliasacra')
options=(!debug !strip)
_appimage="bibliasacra-v${pkgver}-x86_64.AppImage"
source=("https://github.com/ika/Biblia_Sacra/releases/download/v${pkgver}/${_appimage}")
md5sums=('de24b4e26c788222615989cc27ec4d90')

prepare() {
    chmod +x "${_appimage}"
  ./${_appimage} --appimage-extract ${_appname}.desktop
  ./${_appimage} --appimage-extract ${_appname}.png
}

package() {

  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/appimages/${_appname}.AppImage"
	
  # Symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/appimages/${_appname}.AppImage" "${pkgdir}/usr/bin/${_appname}"
  
  # Desktop
  install -Dm755 "squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
        
  # Icons
  install -dm755 "${HOME}/.local/share/icons"
  xdg-icon-resource install --mode user --novendor --size 128 "squashfs-root/${_appname}.png"
  xdg-icon-resource install --mode user --novendor --size 64  "squashfs-root/${_appname}.png"
  xdg-icon-resource install --mode user --novendor --size 48  "squashfs-root/${_appname}.png"
  xdg-icon-resource install --mode user --novendor --size 32  "squashfs-root/${_appname}.png"
  xdg-icon-resource install --mode user --novendor --size 22  "squashfs-root/${_appname}.png"
  xdg-icon-resource install --mode user --novendor --size 16  "squashfs-root/${_appname}.png"
}

