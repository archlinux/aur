# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-madanalysis
pkgver=1.1.8
pkgrel=20160926
pkgdesc="Parton showering, hadronization and detector simulation."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh' 'perl')
optdepends=('topdrawer')
makedepends=('gcc-fortran')
source=("http://madgraph.hep.uiuc.edu/Downloads/MadAnalysis_V${pkgver}.tar.gz")
sha256sums=('248bd3493f9dc4f566dd85c033754b3e7b631107ac2ad55f4793f0015bb31669')

build () {
    cd "${srcdir}/MadAnalysis"
    make
    make clean
}

package() {
    install -Dm755 "${srcdir}/MadAnalysis/combine-pl" "${pkgdir}/usr/bin/combine-pl"
    rm "${srcdir}/MadAnalysis/combine-pl"
    install -Dm755 "${srcdir}/MadAnalysis/epstosmth" "${pkgdir}/usr/bin/epstosmth"
    rm "${srcdir}/MadAnalysis/epstosmth"
    install -Dm755 "${srcdir}/MadAnalysis/plot_events" "${pkgdir}/usr/bin/plot_events"
    rm "${srcdir}/MadAnalysis/plot_events"

    mkdir -p "${pkgdir}/usr/share/madgraph/MadAnalysis"
    cp -a "${srcdir}/MadAnalysis/." "${pkgdir}/usr/share/madgraph/MadAnalysis"

    find "${pkgdir}/usr/share/" -type f -executable -print0 | xargs -0 chmod -x
}

# Local Variables:
# mode: sh
# End:
