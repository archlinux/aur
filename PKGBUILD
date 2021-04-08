# Maintainer: ReneganRonin <renegan.ronin@gmail.com>

pkgname=madgraph-pythia8-interface
pkgver=1.0
pkgrel=9
pkgdesc="MadGraph Pythia8 interface"
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=(
    'hepmc'
    'madgraph'
    'pythia8'
    'python2'
)
source=(
    "http://madgraph.phys.ucl.ac.be/Downloads/MG5aMC_PY8_interface/MG5aMC_PY8_interface_V${pkgver}.tar.gz"
    "python2.patch"
    "compile.patch"
    "pythia.patch"
)
sha256sums=('7c4aecc1e933d24629ec2723ca3d65a3619e12a9e1f9f9bc6cda6e462f4de478'
            '632adc73e951df4341709adeafd3a7c72da1752f8af61037eae2b87a08ca9a64'
            'a2342b3d981e1c8d737244e3ec68f11b1e8c4f18502bce5dc7afcc1335910452'
            'aba91f30a37d67294a2b948870b2308f4dd2dbbba0cfa53f743b5d84e05cafbc')

prepare() {
    #msg2 "Fixing python references for python2"
    #patch -p 1 < python2.patch

    msg2 "Fixing compile.py"
    patch -p 1 < compile.patch

    msg2 "Fixing Pythia location"
    patch -p 1 < pythia.patch

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
