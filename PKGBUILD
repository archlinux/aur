pkgname=healpix
_pkgname=${pkgname}
pkgver='3.31_2016Aug26'
_dir='Healpix_3.31'
pkgrel=5
pkgdesc="Software for pixelization, hierarchical indexation, synthesis, analysis, and visualization of data on the sphere."
arch=(any)
url="https://sourceforge.net/projects/healpix/"
license=('GPLv2')
groups=()
depends=(cfitsio)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/files/${_dir}/Healpix_${pkgver}.tar.gz")
sha256sums=('ddf437442b6d5ae7d75c9afaafc4ec43921f903c976e25db3c5ed5185a181542')
build() {
    cd "${srcdir}/${_dir}/src/C/autotools"
    autoreconf --install
    ./configure --prefix="${pkgdir}/usr"
    make

    cd "${srcdir}/${_dir}/src/cxx/autotools"
    autoreconf --install
    ./configure --prefix="${pkgdir}/usr"
    make
}

#check() {
#    cd "${srcdir}/${_dir}"
#}
package() {
    cd "${srcdir}/${_dir}/src/C/autotools"
    make install
    cd "${srcdir}/${_dir}/src/cxx/autotools"
    make install    
}

