# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-pythia8-interface
pkgver=1.0
pkgrel=6
pkgdesc="MadGraph Pythia8 interface"
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=(
    'hepmc'
    'madgraph'
    'pythia'
    'python2'
)
source=("http://madgraph.physics.illinois.edu/Downloads/MG5aMC_PY8_interface/MG5aMC_PY8_interface_V${pkgver}.tar.gz"
        "python2.patch")
sha256sums=('e4a9925a0cfa399fb993a8c28df522c15c78afeeedaf23ce56a44d54cd2c5639'
            '632adc73e951df4341709adeafd3a7c72da1752f8af61037eae2b87a08ca9a64')

prepare() {
    msg2 "Fixing python references for python2"
    patch -p 1 < python2.patch
}

build() {
    ./compile.py --pythia8_makefile /usr /opt/madgraph
}

package() {
    msg2 "Installing files"

    destdir="${pkgdir}/opt/madgraph/pythia8-interface"
    mkdir -p "${destdir}"
    install -Dm755 "${srcdir}/MG5aMC_PY8_interface" "${destdir}/MG5aMC_PY8_interface"
    install -Dm644 "${srcdir}/MG5AMC_VERSION_ON_INSTALL" "${destdir}/MG5AMC_VERSION_ON_INSTALL"
    install -Dm644 "${srcdir}/PYTHIA8_VERSION_ON_INSTALL" "${destdir}/PYTHIA8_VERSION_ON_INSTALL"
    install -Dm644 "${srcdir}/VERSION" "${destdir}/VERSION"
    install -Dm644 "${srcdir}/MultiHist.h" "${destdir}/MultiHist.h"
    install -Dm644 "${srcdir}/SyscalcVeto.h" "${destdir}/SyscalcVeto.h"
}

# Local Variables:
# mode: sh
# End:
