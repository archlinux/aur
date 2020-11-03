# Maintainer: Roosted7 <mail@thomasroos.nl>
# Maintainer: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20201102
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
sha512sums=('9cda7f82c1424cb9476113d7ddf7965d818d95350dfdbf71536748a117d0de2c070cebb2aed980208d6142c3eb9e3d2331210cffa900209fa4320195c92fd7f1')


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


