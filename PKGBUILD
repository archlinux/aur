# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=pdb2pqr
pkgver=2.1.1
pkgrel=3
pkgdesc="Electrostatic and solvation properties for complex molecules"
arch=(x86_64 i686)
url="http://www.poissonboltzmann.org/"
license=('MIT')
depends=('swig' 'python2' 'python2-networkx' 'python2-numpy' 'apbs')
makedepends=('git' 'gcc')
source=("git+https://github.com/Electrostatics/apbs-pdb2pqr.git#commit=433a1984a632b396bda11416b757d00e4ef5189e"
        "pdb2pqr.patch")
md5sums=('SKIP'
         '19cb8e794d49e4d2bc04df54a895f3ad')

prepare() {
    cd ${srcdir}/apbs-pdb2pqr/pdb2pqr

    patch -Np0 -i "${srcdir}/pdb2pqr.patch"
}

build() {
	cd ${srcdir}/apbs-pdb2pqr/pdb2pqr

    python2 scons/scons.py
}

package() {
	cd ${srcdir}/apbs-pdb2pqr/pdb2pqr

    mkdir -p ${pkgdir}/opt/pdb2pqr

    python2 scons/scons.py PREFIX=${pkgdir}/opt/pdb2pqr install
    touch ${pkgdir}/opt/pdb2pqr/__init__.py
}
