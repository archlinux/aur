# Contributor: Roosted7 <mail@thomasroos.nl>
# Contributor: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20250506
pkgrel=1
pkgdesc="A tool for converting images from the complicated formats used by scanner manufacturers (DICOM, PAR/REC) to the simple NIfTI format"
arch=(x86_64)
url="https://www.nitrc.org/projects/dcm2nii/"
license=('MIT' 'public domain')
depends=('zlib')
makedepends=('cmake' 'yaml-cpp' 'python-sphinx' 'git')
optdepends=('pigz')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/rordenlab/dcm2niix/archive/v${pkgver}.tar.gz")
sha512sums=('1954cc4229478bee69bb0382c90a5c212da4b632fd8f6a5aeb8342d1fa8ac704c83313ecae8cf7b00f6cd8614cc3826a7aefa0209c2633f8ef3c0f1c4b367e3e')


build()
{
	cd "$srcdir/$pkgname-$pkgver"
	export CMAKE_POLICY_VERSION_MINIMUM=3.5
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


