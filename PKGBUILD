# Maintainer: Roosted7 <mail@thomasroos.nl>
# Maintainer: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20200331
pkgrel=1
pkgdesc="A tool for converting images from the complicated formats used by scanner manufacturers (DICOM, PAR/REC) to the simple NIfTI format"
arch=(x86_64)
url="https://www.nitrc.org/projects/dcm2nii/"
license=('MIT' 'public domain')
depends=('zlib')
makedepends=('cmake' 'yaml-cpp' 'python-sphinx')
optdepends=('pigz')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/rordenlab/dcm2niix/archive/v${pkgver}.tar.gz")
sha512sums=('0d5fd7210088f7b68e6d49a679e331d05d1d26296c0c4b9b940005c698a5f9e717de06e548684160a51985b63058c48c46d7019256e7493f3152fce980af5ec6')


build() 
{
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBATCH_VERSION=ON -DUSE_SYSTEM_ZLIB=ON -DBUILD_DOCS=ON ..
	make
}



package() 
{
	cd "$srcdir/$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir" install
}
