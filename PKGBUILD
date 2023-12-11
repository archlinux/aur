# Maintainer: Jove Yu <yushijun110 at 126 dot com>

_pkgver=v1.0.6
_channel=stable
pkgname=lazycat-cloud-client
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='懒猫微服'
url='https://lazycat.cloud'
arch=('x86_64')
license=('custom')
depends=('zenity' 'zstd')
source=("https://dl.lazycat.cloud/client/desktop/${_channel}/lzc-client-desktop_${_pkgver}.tar.zst")
noextract=("lzc-client-desktop_${_pkgver}.tar.zst")
sha256sums=('ec89e8f2031259daabfcafe494b1119ef3b9678324f4a29877f0dfd09920055f')

package() {
  install -d ${pkgdir}/opt/lzc-client-desktop/

  tar xf lzc-client-desktop_${_pkgver}.tar.zst -C ${pkgdir}/opt/lzc-client-desktop

  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/lzc-client.desktop ${pkgdir}/usr/share/applications/lzc-client.desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/icon.png ${pkgdir}/usr/share/icons/lzc-client.png
  chmod +x ${pkgdir}/opt/lzc-client-desktop/core/lzc-core

  sed -i 's|Exec=.*|Exec=/opt/lzc-client-desktop/lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client.desktop
  sed -i 's|Icon=.*|Icon=lzc-client|' ${pkgdir}/usr/share/applications/lzc-client.desktop
  sed -i '/chmod/d' ${pkgdir}/opt/lzc-client-desktop/runcore.sh

}
