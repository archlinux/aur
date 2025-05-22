# Maintainer: ReneganRonin <renegan.ronin@gmail.com> 
# Maintainer: w568w <w568w at outlook dot com>

_name=delphes-madgraph
pkgname=${_name}-git
pkgver=3.5.1pre12.r13.g98f15ad
pkgrel=1
pkgdesc="A framework for fast simulation of a generic collider experiment (compiled by make instead of CMake for MadGraph. Can be coexisted with delphes)"
url="http://cp3.irmp.ucl.ac.be/projects/delphes"
conflicts=("$_name")
provides=('delphes' "$_name")
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=("root"
         "cern-vdt")
makedepends=('make')
optdepends=('madgraph: this package provides Delphes interface for MadGraph')
source=("${pkgname}::git+https://github.com/delphes/delphes.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/$pkgname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir"/$pkgname
    make
    rm --recursive --force "$srcdir/$pkgname/tmp"
}

package() {
    install -dm755 "$pkgdir/opt/Delphes"

    cp --recursive "$srcdir/$pkgname/"* "$pkgdir/opt/Delphes/"
}
