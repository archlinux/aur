# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft-git
pkgver=3.3.2rc2.r1.gf8a4df9
pkgrel=1
pkgdesc="Library for computing Non-uniform Fast Fourier Transforms."
arch=(i686 x86_64)
url="https://www-user.tu-chemnitz.de/~potts/nfft/"
license=('GPL2')
depends=('fftw')
optdepends=('openmp: for OpenMP support')
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(nfft)
source=($pkgname::git+https://github.com/NFFT/nfft.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
    ./bootstrap.sh
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
