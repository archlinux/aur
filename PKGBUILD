# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=remote-desktop-manager
pkgver=2020.2.0.0
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=()
options=(!strip)
source=("${pkgname}_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/2020.2.0.0/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('0241756ce658a78994a8d1a6e5281abbbcb34add7bf64253e4622c682f175b00')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
  sed -i "s/usr\/lib/opt/" "${srcdir}/bin/remotedesktopmanager"
  sed -i "s/usr\/lib/opt/" "usr/share/applications/remotedesktopmanager.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "bin/remotedesktopmanager" "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/opt"
  mv "usr/lib/devolutions" "${pkgdir}/opt/"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/remotedesktopmanager.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/icons"
  mv "usr/share/icons/remotedesktopmanager.png" "${pkgdir}/usr/share/icons/"
}

