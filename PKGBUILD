# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=remote-desktop-manager
pkgver=2023.3.0.7
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('webkit2gtk' 'p11-kit' 'vte3')
options=(!strip)
install=${pkgname}.install
source=("RemoteDesktopManager_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager_${pkgver}_amd64.deb")
sha256sums=('8CF628BBC280ACC044060C4383BB456BB48A9476CAAD0ADBAB9B309FB77C317F')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
  sed -i "s/usr\/lib/opt/" "${srcdir}/bin/remotedesktopmanager"
  sed -i "s/usr\/lib/opt/" "${srcdir}/usr/share/applications/remotedesktopmanager.desktop"
  sed -i "s/RemoteDesktopManager\/RemoteDesktopManager/RemoteDesktopManager\/RemoteDesktopManager %u/" "${srcdir}/usr/share/applications/remotedesktopmanager.desktop"
  echo "MimeType=x-scheme-handler/rdm;" >> "${srcdir}/usr/share/applications/remotedesktopmanager.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "bin/remotedesktopmanager" "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/opt/devolutions"
  mv "usr/lib/devolutions/RemoteDesktopManager" "${pkgdir}/opt/devolutions"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/remotedesktopmanager.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/icons"
  mv "usr/share/icons/remotedesktopmanager.png" "${pkgdir}/usr/share/icons/"
}

