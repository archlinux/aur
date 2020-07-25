# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
pkgver='3.70'
_pkgdate='2020Jul23'
pkgrel=1
pkgdesc="Software for pixelization, hierarchical indexation, synthesis, analysis, and visualization of data on the sphere."
arch=('x86_64')
url="https://healpix.jpl.nasa.gov/"
license=('GPL2')
groups=()
depends=(cfitsio libsharp)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://downloads.sourceforge.net/project/healpix/Healpix_${pkgver}/Healpix_${pkgver}_${_pkgdate}.tar.gz")
md5sums=('bdcc2a4b1ede3ed5a07be57e4aec01d2')
sha1sums=('54968199cc2c3b3754028d65317abb8dd1f7293a')
sha256sums=('8841f171f1e22e75ea130e12e5cdc5bcf85dbec79f9f67dd1bf27e99fd20b6d1')
build() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j

    cd "${srcdir}/Healpix_${pkgver}/src/cxx"
    autoreconf --install
    ./configure --prefix=/usr
    make -j
}

package() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    make DESTDIR=${pkgdir} install
    cd "${srcdir}/Healpix_${pkgver}/src/cxx"
    make DESTDIR=${pkgdir} install
}

