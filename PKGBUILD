# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-pythia-pgs
pkgver=2.4.4
pkgrel=20160610
pkgdesc="Parton showering, hadronization and detector simulation."
url="https://launchpad.net/pythia-pgs-for-mg"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh')
source=("http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V${pkgver}.tar.gz")
sha256sums=('9d6cd804995b5fad0ed0bc5ad24f529bc533221279faa4d772421673fd51d775')

prepare() {
    if [[ "$arch" -eq "i686" ]]; then
        sed -i "s/MBITS=64/MBITS=32/" pythia-pgs/src/make_opts
    fi
}

build () {
    cd "${srcdir}/pythia-pgs"
    make
    find . -type f -name "*.o" | xargs rm

    echo "Patching paths"
    find . -type f -print0 | xargs -0 sed -i "s|${srcdir}|/usr/share/madgraph|g"
}

package() {
    mkdir -p "${pkgdir}/usr/share/madgraph/pythia-pgs"
    cp -a "${srcdir}/pythia-pgs/." "${pkgdir}/usr/share/madgraph/pythia-pgs"
}

# Local Variables:
# mode: sh
# End:
