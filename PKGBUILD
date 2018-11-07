# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
_ver='3.40'
_date='2018Jun22'
pkgver="${_ver}_${_date}"
pkgrel=2
pkgdesc="Software for pixelization, hierarchical indexation, synthesis, analysis, and visualization of data on the sphere."
arch=('x86_64')
url="https://healpix.jpl.nasa.gov/"
license=('GPL2')
groups=()
depends=(cfitsio)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://downloads.sourceforge.net/project/healpix/Healpix_${_ver}/Healpix_${pkgver}.tar.gz")
md5sums=('e40b4a439f34b6af11aa243751b37e1c')
sha1sums=('a26c7b19b2ef78aa2a7a519121bf489c5b979826')
sha256sums=('f10ce170a10a2f37830c65616554c39005442021741ed19c1efa998994d8a069')
build() {
    cd "${srcdir}/Healpix_${_ver}/src/C/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j

    cd "${srcdir}/Healpix_${_ver}/src/cxx/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j
}

package() {
    cd "${srcdir}/Healpix_${_ver}/src/C/autotools"
    make DESTDIR=${pkgdir} install
    cd "${srcdir}/Healpix_${_ver}/src/cxx/autotools"
    make DESTDIR=${pkgdir} install
}

