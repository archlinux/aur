pkgname=mopac
pkgver=22.0.6
pkgrel=1
pkgdesc="Molecular Orbital PACkage"
arch=(x86_64)
url="https://github.com/openmopac/mopac"
license=(LGPL)
depends=(blas lapack)
makedepends=(gcc-fortran cmake)
checkdepends=(python python-numpy)
provides=(mopac)
replaces=(mopac7)
conflicts=(mopac7)
source=($pkgname-$pkgver.tar.gz::https://github.com/openmopac/mopac/archive/v$pkgver.tar.gz)
sha256sums=('4014ab3a793490247082d178187acaf8abea2b30cb1804363aa2439e709b02b3')

build(){
    cd $pkgname-$pkgver
    cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
    cmake --build build -j`getconf _NPROCESSORS_ONLN`
}

check(){
    ctest --test-dir build -j`getconf _NPROCESSORS_ONLN`
}

package(){
    cmake --install build --install-prefix $pkgdir/usr/
}
