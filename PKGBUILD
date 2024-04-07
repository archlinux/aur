# Maintainer: Jove Yu <yushijun110 at 126 dot com>

_pkgver=v1.0.70
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
source=(
  "https://dl.lazycat.cloud/client/desktop/${_channel}/lzc-client-desktop_${_pkgver}.tar.zst"
  "lzc-client-desktop")
install='lazycat-cloud-client.install'
noextract=("lzc-client-desktop_${_pkgver}.tar.zst")
sha256sums=('f6a4b5e38ef9382b425b994f3e1717402a9782200014c18ec502fece179dd342'
            '0670fac388eb62ea33daa0d1ca3aa99637d922720aa55f392c021f24ba27eb8c')

package() {
  install -d ${pkgdir}/opt/lzc-client-desktop/

  tar xf lzc-client-desktop_${_pkgver}.tar.zst -C ${pkgdir}/opt/lzc-client-desktop

  install -Dm755 ${srcdir}/lzc-client-desktop ${pkgdir}/usr/bin/lzc-client-desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/lzc-client.desktop ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/icon.png ${pkgdir}/usr/share/icons/lzc-client-desktop.png

  sed -i '/chmod/d' ${pkgdir}/opt/lzc-client-desktop/runcore.sh
  chmod +x ${pkgdir}/opt/lzc-client-desktop/core/lzc-core
  chmod +x ${pkgdir}/opt/lzc-client-desktop/rclone

  sed -i 's|Exec=.*|Exec=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  sed -i 's|Icon=.*|Icon=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop

}
