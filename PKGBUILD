# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opensage-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="OpenSAGE is a free, open source re-implementation of SAGE, the 3D real time strategy (RTS) engine used in Command & Conquer: Generals and other RTS titles from EA Pacific. Written in C#. Not affiliated with EA"
arch=('x86_64')
url='https://opensage.github.io'
license=('LGPL3')
depends=('openal' 'mesa')
makedepends=('unzip')
noextract=("${pkgname}-${pkgver}.zip")
install=opensage.install
provides=('opensage')
source=("${pkgname}-${pkgver}.zip::https://github.com/OpenSAGE/OpenSAGE/releases/download/v${pkgver}/linux-x64.zip")
sha256sums=('e5f4e86e31da8fe598fde4f8f7296e46337525bb2a8704f5b7ec655bc91be86c')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/opensage/"
  mkdir -p "${pkgdir}/usr/lib/"
  mkdir -p "${pkgdir}/usr/bin"
  unzip ${pkgname}-${pkgver}.zip -d "${pkgdir}/opt/opensage"
  chmod 755 "${pkgdir}/opt/opensage/OpenSage.Launcher"
  chmod 755 "${pkgdir}/opt/opensage/OpenSage.Viewer"
  ln -s "/opt/opensage/OpenSage.Launcher" ${pkgdir}/usr/bin/opensage-launcher
  ln -s "/opt/opensage/OpenSage.Viewer" ${pkgdir}/usr/bin/opensage-viewer
  ln -s "/usr/lib/libopenal.so" ${pkgdir}/usr/lib/libsoft_oal.so #Bugfix
}