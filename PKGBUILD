# Maintainer: kumen

pkgname="mcuviewer-bin"
pkgver=1.2.6
pkgrel=2
pkgdesc="Real-time embedded variable & trace viewer "
arch=("x86_64")
depends=("libusb" "glfw" "gtk3" "glib2")
optdepends=('jlink-software-and-documentation' 'stlink' 'arm-none-eabi-gdb')
conflicts=('mcuviewer' 'mcuviewer-git')
provides=('mcuviewer')
url="https://mcuviewer.com"
license=('comercial')
options=(!strip)

source=(${pkgname}_${pkgver}.zip::https://download.mcuviewer.com/releases/stable/1.2.6_f910782/MCUViewer_Linux.zip)
sha256sums=('baa49b7eb953f259a062fba0c46f4de0101898ab9e2f28abe6d6279ae708b67a')


prepare()
{
  bsdtar xvf ${srcdir}/MCUViewer_Linux/MCUViewer-${pkgver}-Linux.deb
}

package()
{
  bsdtar xvf ${srcdir}/data.tar.gz -C "$pkgdir"
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/local/bin"
  ln -s /usr/local/MCUViewer/MCUViewer "${pkgdir}/usr/local/bin/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
