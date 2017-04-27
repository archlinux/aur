# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-pythia-pgs
pkgver=2.4.5
pkgrel=3
pkgdesc="Parton showering, hadronization and detector simulation."
url="https://launchpad.net/pythia-pgs-for-mg"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh')
source=("http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V${pkgver}.tar.gz")
sha256sums=('96d2183d914ae5ad2af084fb90b69aca3ab10ca6adf1d915cb1d143317e387aa')

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
    mkdir -p "${pkgdir}/opt/madgraph/pythia-pgs"
    cp -a "${srcdir}/pythia-pgs/." "${pkgdir}/opt/madgraph/pythia-pgs"
}

# Local Variables:
# mode: sh
# End:
