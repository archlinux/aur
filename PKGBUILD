# Maintainer: Robin Hilgers <r.hilgers@fz-juelich.de>
pkgname=fleur-develop
pkgver=latest
pkgrel=5
pkgdesc="FLEUR is  a feature-full and freely available FLAPW (full-potential linearized augmented planewave) code, based on density-functional theory."
arch=(x86_64)
url="https://iffgit.fz-juelich.de/fleur/fleur.git"
license=('MIT')
depends=()
makedepends=(git cmake gcc gcc8-fortran blas lapack libxml2 hdf5)
optdepends=()
provides=(fleur)
source=("git+$url")
noextract=()

build() {
        export FC=gfortran-8
        export CC=gcc
        export CXX=g++
	./fleur/configure.sh -l dev-serial -includedir /usr/include/
        cd "build.dev-serial" 
	make -j
}

check() {
	cd "build.dev-serial" 
        ctest
        rm -r "Testing/"
        }

package() {
	cp -r "build.dev-serial" "$pkgdir/"
}

md5sums=('SKIP')
