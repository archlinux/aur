# Maintainer: Roosted7 <mail@thomasroos.nl>
# Maintainer: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20211006
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
sha512sums=('8ce20be3c03456f47ed477f96bf6429a99dd54b6475ec65565d62e1965a2c5dbd0dbd1ec5958dad85dda74c7f518e733f0eb5f759a00153d89b1ce2ce0777c96')


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


