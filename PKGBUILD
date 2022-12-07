# Contributor: Jia Li <lijia1608@gmail.com>
# Maintainer: Francesco Zardi <frazar0 (at) hotmail (dot) it>

pkgname=nfft
pkgver=3.5.3
pkgrel=1
pkgdesc="Library for computing Non-uniform Fast Fourier Transforms."
arch=(i686 x86_64)
url="https://www-user.tu-chemnitz.de/~potts/nfft/"
license=('GPL2')
depends=('fftw')
makedepends=('autoconf')
optdepends=('openmp: for OpenMP support')
provides=($pkgname=$pkgver)
conflicts=('nfft-git')
source=("https://github.com/NFFT/nfft/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('caf1b3b3e5bf8c33a6bfd7eca811d954efce896605ecfd0144d47d0bebdf4371')

build() {
	cd "$pkgname-$pkgver" || exit 1

	./bootstrap.sh

	./configure \
		--prefix=/usr \
		--enable-all \
		--enable-openmp

	make
}

package() {
	cd "$pkgname-$pkgver" || exit 1

	make DESTDIR="$pkgdir/" install
}

check() {

	cd "$pkgname-$pkgver" || exit 1
	make check
}
