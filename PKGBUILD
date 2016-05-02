# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=alpscore
pkgver=0.5.4
pkgrel=1
epoch=
pkgdesc="ALPS Core libraries for numerical simulations of condensed matter systems based on ALPS."
arch=(i686 x86_64)
url="http://alpscore.org"
license=('GPL')
depends=('cmake>=2.8.12' 'boost>=1.54.0' 'hdf5>=1.8')
makedepends=()
checkdepends=()
optdepends=('openmpi: for MPI support'
            'doxygen: for building low-level docs')
provides=($pkgname=$pkgver)
conflicts=(alpscore-git alps)
install=
source=("https://github.com/ALPSCore/ALPSCore/archive/v$pkgver.tar.gz")
md5sums=('b887c9328e2a22afa123663cf888b768')

build() {
	cd "ALPSCore-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "ALPSCore-$pkgver/build"
	make test
}

package() {
	cd "ALPSCore-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
