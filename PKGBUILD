# Maintainer: Ricardo Rodríguez Schmidt <ricrogz at gmail.com>

pkgname=pymol2
pkgver='2.0.7'
pkgrel='3'
pkgdesc='Molecular visualization system on an Open Source foundation with modern PyQt interface. Includes Python 2 & 3 Bindings.'
arch=('x86_64')
options=(!strip)
url='https://pymol.org/2/'
license=('Commercial')
depends=('glew' 'glut' 'libgl' 'libxml2' 'python-numpy' 'python-pmw' 'python-pyqt5')
makedepends=('desktop-file-utils' 'gendesk')
conflicts=(pymol)
source=("https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py27_0.tar.bz2"
"https://anaconda.org/schrodinger/pymol/${pkgver}/download/linux-64/pymol-${pkgver}-py36_0.tar.bz2")
sha1sums=('8f23550513b341fad8a5753aa17facf755414684'
          'aefc79f370cb550a6a91c6e2b14378498eb111f5')
sha256sums=('ab828a456a9e82f137b753e5d66ff3510663c24d220fb731b58b0bddf5e819b5'
            '64e7980ed33a13bd4ee1b18455e32d90089e259b0c26662519b0d41b7a4ae753')

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