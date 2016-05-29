# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-madanalysis
pkgver=1.1.8
pkgrel=20160521
pkgdesc="Parton showering, hadronization and detector simulation."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh' 'perl')
optdepends=('topdrawer')
makedepends=('gcc-fortran')
source=("http://madgraph.hep.uiuc.edu/Downloads/MadAnalysis_V${pkgver}.tar.gz")
sha256sums=('bdf26c4605927007b08f41eae12f218e2053297cfda518eb0e865af289e54ffc')

build () {
    cd "${srcdir}/MadAnalysis"
    make
    find . -type f -name "*.o" | xargs rm -f
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
