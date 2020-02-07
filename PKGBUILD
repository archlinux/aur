# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=multinest
pkgver='3.12'
pkgrel=1
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
    "https://github.com/farhanferoz/MultiNest/archive/ba3e7d812b04e044b4d6e0319bd49a9fa6d78192.tar.gz"
    "https://github.com/JohannesBuchner/PyMultiNest/archive/b147515e950cf225befef3f0e26408c672f01979.tar.gz"
)
sha256sums=(
    '4175009164b362355c4bbef2b2ece73235cfd9b505d4f49fe76e55876609cd4b'
    'cebd358d24044863560d80e43436414a9341c25a25d572db1851a507ecf59bfc'
)
build() {
    cd "${srcdir}/MultiNest-ba3e7d812b04e044b4d6e0319bd49a9fa6d78192/MultiNest_v3.12_CMake/multinest/"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "${srcdir}/MultiNest-ba3e7d812b04e044b4d6e0319bd49a9fa6d78192/MultiNest_v3.12_CMake/multinest"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    cd build
    make DESTDIR=${pkgdir} install 
    cd "${srcdir}/PyMultiNest-b147515e950cf225befef3f0e26408c672f01979/"
    python setup.py install --root="$pkgdir/" --optimize=1

}

