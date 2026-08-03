# Maintainer: DevilishSpirits <devilishspirits@gmail.com>
pkgname=mount-zip
pkgver=1.16
pkgrel=1
epoch=
pkgdesc="FUSE file system for ZIP archives"
arch=(x86_64)
url="https://github.com/google/mount-zip"
license=('GPL3')
depends=('boost-libs' 'icu' 'fuse3>=3.1' 'libzip>=1.0')
makedepends=('boost' 'make' 'pkgconf')
checkdepends=('python')
source=("https://github.com/google/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('758f45d40bc4a5e9ad6a7ebacfd1e2a4bece5381ab11aeced41989e157aad6cd')

build() {
	cd "$pkgname-$pkgver"
	PREFIX=/usr FUSE_MAJOR_VERSION=3 make all
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	PREFIX=/usr make DESTDIR="$pkgdir/" install
}

