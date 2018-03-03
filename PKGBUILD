# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=realvnc-vnc-viewer-5
pkgver=5.3.3
pkgrel=2
pkgdesc='Cross-platform remote access software'
arch=('x86_64')
url='https://www.realvnc.com'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext')
source=("https://www.realvnc.com/download/file/vnc.files/VNC-${pkgver}-Linux-x64-DEB.tar.gz")
sha256sums=('fbc0b1ded3d3bceda5d7e76231849f1271938e71354c97768272d2c99aa4ecd9')
options=(!strip)

package() {
  cd "$srcdir"
  ar x "VNC-Viewer-${pkgver}-Linux-x64.deb"
  bsdtar -x -C "$pkgdir" -f data.tar.gz

  mv "${pkgdir}"/usr/bin/vncviewer "${pkgdir}"/usr/bin/realvnc-vncviewer
  mv "${pkgdir}"/usr/share/man/man1/vncviewer.1.gz "${pkgdir}"/usr/share/man/man1/realvnc-vncviewer.1.gz

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${pkgname%-*}"/copyright "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
