# Maintainer: Jove Yu <yushijun110 at 126 dot com>

_pkgver=v1.0.58
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
sha256sums=('4816f7fc54367e93a4acf7cdb10e99b7f5fbd14a2031a5e49a7ebf2aff75b021'
            '666c44ac630426290fe6061e73194a78eeb112625b353c9615fe175d0b30547e')

package() {
  install -d ${pkgdir}/opt/lzc-client-desktop/

  tar xf lzc-client-desktop_${_pkgver}.tar.zst -C ${pkgdir}/opt/lzc-client-desktop

  install -Dm755 ${srcdir}/lzc-client-desktop ${pkgdir}/usr/bin/lzc-client-desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/lzc-client.desktop ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/icon.png ${pkgdir}/usr/share/icons/lzc-client.png
  chmod +x ${pkgdir}/opt/lzc-client-desktop/core/lzc-core

  sed -i 's|Exec=.*|Exec=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  sed -i 's|Icon=.*|Icon=lzc-client|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  sed -i '/chmod/d' ${pkgdir}/opt/lzc-client-desktop/runcore.sh

}
