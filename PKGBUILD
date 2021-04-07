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
    "compile.patch"
    "pythia.patch"
)
sha256sums=('7c4aecc1e933d24629ec2723ca3d65a3619e12a9e1f9f9bc6cda6e462f4de478'
            '03d4ee5104689c5ef4092bc07f834d6829b734e3d0ee1d613b1ad0048860534f'
            '5ff65a3a48b403410b135f18a7edb9e48b352fd531f33bc5cf6b09522217e0b2')

prepare() {
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
