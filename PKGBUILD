# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opensage-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="OpenSAGE is a free, open source re-implementation of SAGE, the 3D real time strategy (RTS) engine used in Command & Conquer: Generals and other RTS titles from EA Pacific. Written in C#. Not affiliated with EA"
arch=('x86_64')
url='https://opensage.github.io'
license=('LGPL3')
depends=('openal' 'mesa' 'unzip')
noextract=('linux-x64.zip')
install=post_install
provides=('opensage')
source=("https://github.com/OpenSAGE/OpenSAGE/releases/download/v${pkgver}/linux-x64.zip")
md5sums=('a46453c1aed2d0ba273ee143c5bef559')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/opensage/"
  mkdir -p "${pkgdir}/usr/lib/"
  mkdir -p "${pkgdir}/usr/bin"
  unzip linux-x64.zip -d "${pkgdir}/opt/opensage"
  chmod 755 "${pkgdir}/opt/opensage/OpenSage.Launcher"
  chmod 755 "${pkgdir}/opt/opensage/OpenSage.Viewer"
  ln -s "/opt/opensage/OpenSage.Launcher" ${pkgdir}/usr/bin/opensage-launcher
  ln -s "/opt/opensage/OpenSage.Viewer" ${pkgdir}/usr/bin/opensage-viewer
  ln -s "/usr/lib/libopenal.so" ${pkgdir}/usr/lib/libsoft_oal.so #Bugfix
}