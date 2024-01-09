# Maintainer: Jove Yu <yushijun110 at 126 dot com>

_pkgver=v1.0.40
_channel=stable
pkgname=lazycat-cloud-client
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='懒猫微服'
url='https://lazycat.cloud'
arch=('x86_64')
license=('custom')
depends=('gtk3' 'zenity')
makedepends=('tar' 'zstd')
source=("https://dl.lazycat.cloud/client/desktop/${_channel}/lzc-client-desktop_${_pkgver}.tar.zst")
install='lazycat-cloud-client.install'
noextract=("lzc-client-desktop_${_pkgver}.tar.zst")
sha256sums=('7b543d8a1a98f9bdd20688493588c68a1229140c629720ce2255afef6cf6dd46')

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
