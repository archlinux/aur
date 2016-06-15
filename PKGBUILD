# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-pythia-pgs
pkgver=2.4.4
pkgrel=20160521
pkgdesc="Parton showering, hadronization and detector simulation.

If the checksum does not work, it is most likely because of a new release of the
same version.  Let me know via a comment or flag the package as out-of-date."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh')
source=("http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V${pkgver}.tar.gz")
sha256sums=('cd95257e6f079776e5d44e8bceab6414acb4de1dbd3799ba47cc4fdb89a45d6a')

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
