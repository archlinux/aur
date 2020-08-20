# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=remote-desktop-manager-free
pkgver=2020.2.3.0
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager Free centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('webkit2gtk')
options=(!strip)
source=("RemoteDesktopManager.Free_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager.Free_${pkgver}_amd64.deb")
sha256sums=('a032f5d406e41cc5596414a2c48f5f084a68ce5f3d4d7fc7781f8c4665cf0dc5')

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

