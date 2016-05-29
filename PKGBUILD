# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=topdrawer
pkgver=0.0.0
pkgrel=1
pkgdesc="."
url="https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/TopDrawer"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepends=('gcc-fortran' 'gcc-libs')
source=("https://cp3.irmp.ucl.ac.be/projects/madgraph/raw-attachment/wiki/TopDrawer/td.tgz"
        "hollerith.patch")
sha256sums=('e6d82b179b8d89297855f3548e8cea64d51b35e04c1bb635fa2a81280040ac58'
            '2c7b2431af43101f4ce1dc66e7a8fc3302a2ab129dca755385b5992ec2c4b6da')

prepare () {
    sed -i "s/^FF = g77 -fno-backslash$/FF = gfortran -std=legacy -fno-backslash/" Makefile.Linux

    echo "Patching Hollerith variables"
    patch -s -p1 < hollerith.patch
}

build () {
    cd "${srcdir}"
    make
    make clean
}

package () {
    install -Dm755 "${srcdir}/td" "${pkgdir}/usr/bin/td"
}

# Local Variables:
# mode: sh
# End:
