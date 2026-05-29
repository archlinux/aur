# Maintainer: kumen

pkgname="mcuviewer-bin"
pkgver=1.2.7
pkgrel=1
pkgdesc="Real-time embedded variable & trace viewer "
arch=("x86_64")
depends=("libusb" "glfw" "gtk3" "glib2")
optdepends=('jlink-software-and-documentation' 'stlink' 'arm-none-eabi-gdb')
conflicts=('mcuviewer' 'mcuviewer-git')
provides=('mcuviewer')
url="https://mcuviewer.com"
license=('comercial')
options=(!strip)

source=(${pkgname}_${pkgver}.zip::https://download.mcuviewer.com/releases/stable/1.2.7_fa2999b/MCUViewer_Linux_${pkgver}.zip)
sha256sums=('844a6226e8a90522ef691287d9154960c0fea01db1300690e9833a3016f2c400')

prepare()
{
  bsdtar xvf ${srcdir}/MCUViewer_Linux_${pkgver}/MCUViewer-${pkgver}-Linux.deb
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
