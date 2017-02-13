# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-pythia-pgs
pkgver=2.4.5
pkgrel=1
pkgdesc="Parton showering, hadronization and detector simulation."
url="https://launchpad.net/pythia-pgs-for-mg"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh')
source=("http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V${pkgver}.tar.gz")
sha256sums=('cbe24abc976027eba9675d90b8080a2a5231205d55b9f7fbef5092c9ad2c69db')

prepare() {
    if [[ "$arch" -eq "i686" ]]; then
        sed -i "s/MBITS=64/MBITS=32/" pythia-pgs/src/make_opts
    fi
}

build () {
    cd "${srcdir}/pythia-pgs"
    make
    find . -type f -name "*.o" | xargs rm
}

package() {
    mkdir -p "${pkgdir}/usr/share/madgraph/pythia-pgs"
    cp -a "${srcdir}/pythia-pgs/." "${pkgdir}/usr/share/madgraph/pythia-pgs"
}

# Local Variables:
# mode: sh
# End:
