# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=jhdf5
pkgver=19.04.0
pkgrel=1
pkgdesc='An easy-to-use high-level API for HDF5 written in Java.'
arch=('x86_64')
url='https://wiki-bsse.ethz.ch/display/JHDF5'
license=('Apache')
depends=('java-runtime' 'hdf5')
source=("https://wiki-bsse.ethz.ch/download/attachments/26609237/sis-${pkgname}-${pkgver}.zip")
sha256sums=('c29f3443529734033e60dd1dd277d46a34aa5d1072fdf303164481cadfdc703e')

package() {
    cd "${srcdir}/sis-${pkgname}"
    install -Dm755 bin/h5ar "${pkgdir}/usr/bin/h5ar"

    cd "${srcdir}/sis-${pkgname}/doc"
    install -Dm644 JHDF5-${pkgver}.pdf "${pkgdir}/usr/share/doc/${pkgname}/JHDF5-${pkgver}.pdf"

    cd "${srcdir}/sis-${pkgname}/lib"
    _jar_files=$(find . -maxdepth 1 -regex ".*\.jar" | xargs)
    for jar in ${_jar_files}; do
      install -Dm644 ${jar} "${pkgdir}/usr/share/java/${pkgname}/${jar}"
    done
    install -Dm644 native/jhdf5/amd64-Linux/libjhdf5.so "${pkgdir}/usr/lib/libjhdf5.so"
}
