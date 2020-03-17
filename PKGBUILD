pkgname=quantum-espresso
pkgver=6.5
pkgrel=1
pkgdesc="Computer codes for electronic-structure calculations and materials modeling
at the nanoscale. It is based on density-functional theory, plane waves, and
pseudopotentials."
arch=("x86_64")
url="http://www.quantum-espresso.org"
license=('GPL')
depends=(gcc-fortran zlib openmpi lapack numactl blas fftw)
source=("https://gitlab.com/QEF/q-e/-/archive/qe-$pkgver/q-e-qe-$pkgver.tar.gz"
	"https://gitlab.com/QEF/q-e/uploads/edd91febdd3916ce1d527ea00f0a05f0/fox.tgz")
noextract=("fox.tgz")
md5sums=('1af03e99261b1ae113a9ba94faacc5de' '3e4765d44ad77f65ed70c9c2992c0b84')

build() {
	cd "$srcdir/q-e-qe-$pkgver"
	cp "$srcdir/fox.tgz" "$srcdir/q-e-qe-$pkgver/archive"
	FFLAGS="-ffree-line-length-none" ./configure --prefix="$pkgdir/usr"
	make all
}

package() {
	cd "$srcdir/q-e-qe-$pkgver"
	make install
}
