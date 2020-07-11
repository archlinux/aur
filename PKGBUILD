# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=remote-desktop-manager-free
pkgver=2020.2.1.0
pkgrel=3
pkgdesc="Devolutions Remote Desktop Manager Free centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('webkit2gtk')
options=(!strip)
source=("RemoteDesktopManager.Free_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager.Free_${pkgver}_amd64.deb")
sha256sums=('b9744158c94d436eae6802144d97a5b3690e35447cf7bbaf1a5376ccb23b807a')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
  sed -i "s/usr\/lib/opt/" "${srcdir}/bin/remotedesktopmanager.free"
  sed -i "s/usr\/lib/opt/" "usr/share/applications/remotedesktopmanager.free.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "bin/remotedesktopmanager.free" "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/opt/devolutions"
  mv "usr/lib/devolutions/RemoteDesktopManager.Free" "${pkgdir}/opt/devolutions"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/remotedesktopmanager.free.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/icons"
  mv "usr/share/icons/remotedesktopmanager.free.png" "${pkgdir}/usr/share/icons/"
}

