# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=multinest
pkgver='3.12'
pkgrel=3
pkgdesc="MultiNest is a Bayesian inference tool which calculates the evidence and explores the parameter space which may contain multiple posterior modes and pronounced (curving) degeneracies in moderately high dimensions."
arch=(any)
url="https://github.com/farhanferoz/MultiNest"
groups=()
depends=('lapack' 'gcc-fortran' 'openmpi')
license=('custom')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
    "${url}/archive/ba3e7d812b04e044b4d6e0319bd49a9fa6d78192.tar.gz"
)
sha256sums=(
    '4175009164b362355c4bbef2b2ece73235cfd9b505d4f49fe76e55876609cd4b'
)
build() {
    cd "${srcdir}/MultiNest-ba3e7d812b04e044b4d6e0319bd49a9fa6d78192/MultiNest_v3.12_CMake/multinest/"
    mkdir -p build
    cd build
    cmake -E env FFLAGS="-fallow-argument-mismatch" cmake ..
    make
}

package() {
    cd "${srcdir}/MultiNest-ba3e7d812b04e044b4d6e0319bd49a9fa6d78192/MultiNest_v3.12_CMake/multinest"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    cd build
    make DESTDIR=${pkgdir} install 
}
