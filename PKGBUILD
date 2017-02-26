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
        "cmake.patch")
sha256sums=('35a11e7c027a4f0523827babce7b496ff660dfabb2e8b94fd8be1da7468ad197'
            'bfed1d16f3ca1068f60dd38f9b21958331adb7a66af1f8e2bbafb0f842c9203d')

prepare() {
    patch -p 1 < cmake.patch
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

    msg2 "Moving examples and cards"
    mkdir -p "${pkgdir}/usr/share/Delphes"
    mv "${pkgdir}/usr/examples" "${pkgdir}/usr/cards" "${pkgdir}/usr/share/Delphes/"
}

# Local Variables:
# mode: sh
# End:
