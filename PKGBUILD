# Maintainer: Ricardo Rodríguez Schmidt <ricrogz at gmail.com>

pkgname=pymol2
pkgver='2.1.1'
pkgrel='1'
pkgdesc='Molecular visualization system on an Open Source foundation with modern PyQt interface. Includes Python 2 & 3 Bindings.'
arch=('x86_64')
options=(!strip)
url='https://pymol.org/2/'
license=('Commercial')
depends=('glew' 'glut' 'libgl' 'libxml2' 'python-numpy' 'python-pmw' 'python-pyqt5')
makedepends=('desktop-file-utils' 'gendesk')
conflicts=(pymol)
source=("https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py27_2.tar.bz2"
"https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py36_2.tar.bz2")
sha1sums=('3657fa8d27bc7f94bd781918af570e2faa228402'
          'baa0725d3b78cf13175b53fac7b2737f95a4fe9b')
sha256sums=('b69760a1db822eb3738976c40aea675009432bf7c073513b4dbfc1d218d1ce0d'
            'afefbc33f53b4c917b0bbc8c253f7c9629249f05a52f17ec54b97a04b95bdcb3')

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
