# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=jhdf5
pkgver=14.12.0
pkgrel=1
pkgdesc='An easy-to-use high-level API for HDF5 written in Java.'
arch=('i686' 'x86_64')
url='https://wiki-bsse.ethz.ch/display/JHDF5'
license=('Apache')
depends=('java-runtime' 'hdf5')
source=("https://wiki-bsse.ethz.ch/download/attachments/26609237/sis-${pkgname}-${pkgver}-r33145.zip")
sha256sums=('3ae0502d8025817386528a6ff686e557bd5217b6b17502981325bc6fa0d69632')

package() {
    cd "${srcdir}/sis-${pkgname}"
    install -Dm755 bin/h5ar.sh "${pkgdir}/usr/bin/h5ar"

    cd "${srcdir}/sis-${pkgname}/doc"
    install -Dm644 JHDF5.pdf "${pkgdir}/usr/share/doc/${pkgname}/JHDF5.pdf"

    cd "${srcdir}/sis-${pkgname}/lib"
    _jar_files=$(find . -maxdepth 1 -regex ".*\.jar" | xargs)
    for jar in ${_jar_files}; do
      install -Dm644 ${jar} "${pkgdir}/usr/share/java/${pkgname}/${jar}"
    done
    if test "$CARCH" == i686; then
        install -Dm644 native/jhdf5/i386-Linux/libjhdf5.so "${pkgdir}/usr/lib/libjhdf5.so"
    else
        install -Dm644 native/jhdf5/amd64-Linux/libjhdf5.so "${pkgdir}/usr/lib/libjhdf5.so"
    fi
}
