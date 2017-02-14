# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=delphes
pkgver=3.4.0
pkgrel=5
pkgdesc="A framework for fast simulation of a generic collider experiment"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("cmake"
         "root"
         "exrootanalysis")
source=("https://github.com/delphes/delphes/archive/${pkgver}.tar.gz"
        "0f5bf9d.patch"
        "7d83636.patch"
        "781e311.patch")
sha256sums=('35a11e7c027a4f0523827babce7b496ff660dfabb2e8b94fd8be1da7468ad197'
            '502ba71464610b4a76708941cb528bfb30829ebaff6a6b8509304086d13cefea'
            '550ed21c707ba71c8df702291b914b00835c44b56118cdc074c31d9a43e7ae6d'
            'c48fab60b712d7ac3841ebeba4feb8201da3daf73ebcc7103790f088543d39ea')

prepare() {
    patch -p 1 < 0f5bf9d.patch
    patch -p 1 < 781e311.patch
    patch -p 1 < 7d83636.patch
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" delphes-${pkgver}
    make
}

package() {
    make install

    # Remove ExRootAnalysis
    rm -rf "${pkgdir}/usr/include/ExRootAnalysis"
    rm "${pkgdir}/usr/lib/libExRootAnalysisDict_rdict.pcm"

    msg2 "Moving examples"
    mkdir -p "${pkgdir}/usr/share/Delphes"
    mv "${pkgdir}/usr/examples" "${pkgdir}/usr/share/Delphes/"
}

# Local Variables:
# mode: sh
# End:
