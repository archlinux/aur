# Maintainer: kumen

pkgname="mcuviewer-bin"
pkgver=1.3.0
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

source=(${pkgname}_${pkgver}.zip::https://download.mcuviewer.com/releases/stable/1.3.0_13757d9/MCUViewer_Linux_${pkgver}.zip)
sha256sums=('ee6aba6b33343353ccd95f4f308053086f86fc6a675c089db867f8f679c61798')

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
