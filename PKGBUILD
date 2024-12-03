# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Patrick Kurth <p.kurth@posteo.de>

# PKGBUILD dervied from Patrick's xschem package
_pkgname="xschem"
pkgname="${_pkgname}-git"

pkgver=3.4.5.r147.gce99d09
pkgrel=1
pkgdesc="Schematic editor VLSI/ASIC/analog custom designs - Git Version"
arch=('x86_64')
url="http://github.com/StefanSchippers/xschem"
source=("${_pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')
conflicts=("xschem")
depends=(
    'glibc'
    'libx11' 
    'libxrender' 
    'libxcb' 
    'cairo' 
    'tcl' 
    'tk' 
    'libxpm' 
    'gawk'
    'libjpeg'
)
makedepends=(
    'git'
    'flex' 
    'bison'
)
license=('GPL-2.0-or-later')

pkgver() {
    cd "${_pkgname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
	cd "${_pkgname}"
    make DESTDIR="${pkgdir}/" install
}
