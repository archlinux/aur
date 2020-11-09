# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=remote-desktop-manager-free
pkgver=2020.3.0.0
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager Free centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('webkit2gtk' 'p11-kit')
options=(!strip)
install=${pkgname}.install
source=("RemoteDesktopManager.Free_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager.Free_${pkgver}_amd64.deb")
sha256sums=('1597b215b4977dd0d1fce463e18da10c8338a72f9d997340bae0e851c26d7675')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
  sed -i "s/usr\/lib/opt/" "${srcdir}/bin/remotedesktopmanager.free"
  sed -i "s/usr\/lib/opt/" "usr/share/applications/remotedesktopmanager.free.desktop"
  sed -i "s/RemoteDesktopManager\/RemoteDesktopManager/RemoteDesktopManager\/RemoteDesktopManager %u/" "usr/share/applications/remotedesktopmanager.desktop"
  echo "MimeType=x-scheme-handler/rdm;" >> "usr/share/applications/remotedesktopmanager.desktop"
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

