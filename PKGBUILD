# Contributor: Roosted7 <mail@thomasroos.nl>
# Contributor: liamtimms <timms5000@gmail.com>
pkgname=dcm2niix
pkgver=1.0.20241211
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
sha512sums=('745a3692e45e7218bdb8b5bb81ac6865f2b9229092501ade2fe097fa461ae5df3d418da9a69dafbdc96da8d84863e73f17879906781dc94c4812429cb87e9a89')


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


