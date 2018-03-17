# Maintainer: Ricardo Rodríguez Schmidt <ricrogz at gmail.com>

pkgname=pymol2
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Molecular visualization system on an Open Source foundation with modern PyQt interface. Includes Python 2 & 3 Bindings.'
arch=('x86_64')
options=(!strip)
url='https://pymol.org/2/'
license=('Commercial')
depends=('glew' 'glut' 'libgl' 'libxml2' 'python-numpy' 'python-pmw' 'python-pyqt5')
makedepends=('desktop-file-utils' 'gendesk')
conflicts=(pymol)
source=("https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py27_12.tar.bz2"
"https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py36_13.tar.bz2")
sha1sums=('d2235968caa4452aeb4276d80a15e21c76135c16'
          '82d87968d0936c165daa4724eefc54b93d682a36')
sha256sums=('414c22e5341e16f24e5ea9f5304c7a9df7af0a69b931a7bf9fdb4f793db3722a'
            '71aed2ec05a93cfd27840fa97e71ac06deba9a869740755fb364aaf88774e0ec')

build() {
  # create desktop file
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name="PyMOL2 Molecular Graphics System" --categories="Science;Chemistry"

  mv "${srcdir}/bin/pymol" "${srcdir}/bin/pymol2"
}
package() {
  mkdir -p "${pkgdir}/usr"

  rsync -rtl "${srcdir}/bin" "${pkgdir}/usr"
  rsync -rtl "${srcdir}/lib" "${pkgdir}/usr"
  rsync -rtl "${srcdir}/share" "${pkgdir}/usr"

  install -Dm644 "${srcdir}/pymol2.desktop" "${pkgdir}/usr/share/applications/pymol2.desktop"
  install -Dm644 "${srcdir}/share/pymol/data/pymol/icons/icon2_32x32.png" "${pkgdir}/usr/share/pixmaps/pymol2.png"
}
