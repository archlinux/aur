# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
pkgver='3.50'
_pkgdate='2018Dec10'
pkgrel=1
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
source=("https://downloads.sourceforge.net/project/healpix/Healpix_${pkgver}/Healpix_${pkgver}_${_pkgdate}.tar.gz")
md5sums=('ed7c9a3d7593577628ed1286fa7a9250')
sha1sums=('f3796cad976c9c8e519a9d4929edbe57ff73e766')
sha256sums=('ec9378888ef8365f9a83fa82e3ef3b4e411ed6a63aca33b74a6917c05334bf4f')
build() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j

    cd "${srcdir}/Healpix_${pkgver}/src/cxx/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j
}

package() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    make DESTDIR=${pkgdir} install
    cd "${srcdir}/Healpix_${pkgver}/src/cxx/autotools"
    make DESTDIR=${pkgdir} install
}

