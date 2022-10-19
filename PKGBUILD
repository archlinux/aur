# Maintainer: Roosted7 <mail@thomasroos.nl>
# Maintainer: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20220720
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
sha512sums=('2c372849c417637b307a286c8ed5a4b13f097e0742ce1a06243a0db767207a2f7e541c7a30824713b1d0ed1e1995001e790c83c1bd5d742b2f3ac7b15685011e')


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


