# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=exrootanalysis
pkgver=0.0.23
pkgrel=1
pkgdesc="A package designed to simplify ROOT tree production and analysis."
url="https://cp3.irmp.ucl.ac.be/projects/ExRootAnalysis"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('root')
source=("${pkgname}-r${pkgver##*.}.zip::https://cp3.irmp.ucl.ac.be/projects/ExRootAnalysis/changeset/${pkgver##*.}/trunk?old_path=%2F&format=zip"
        "fix.patch")
sha256sums=('b30897ae035b741fa93f47e7cd5adc5f942d77498c143ef17ef4f1377207086e'
            '6147bc6c3018ff8c80f3ba60f75e210921e3f714fb35d83c40f47b0401df821c')

prepare() {
    patch -p 1 < fix.patch
}

build() {
    cd "trunk"
    make
}

package() {
    mkdir -p "${pkgdir}/usr/include"
    cp -r "${srcdir}/trunk/ExRootAnalysis" "${pkgdir}/usr/include"
    cp -r "${srcdir}/trunk/lib" "${pkgdir}/usr/"
    cp "${srcdir}/trunk/tmp/src/ExRootAnalysisDict_rdict.pcm" "${pkgdir}/usr/lib/libExRootAnalysisDict_rdict.pcm"
}

# Local Variables:
# mode: sh
# End:
