# Maintainer: éclairevoyant
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free dot fr>
# Contributor: zhuqin <zhuqin83 at gmail dot com>

_pkgname=lensfun
pkgname="$_pkgname-git"
pkgver=0.3.2.r2592.gec9412d2
pkgrel=1
pkgdesc='Database of photographic lenses and associated library'
arch=('i686' 'x86_64')
url="https://lensfun.github.io/"
license=('LGPL3')
depends=('glibc' 'glib2')
makedepends=('cmake' 'git'  'libpng' 'python-setuptools')
optdepends=('python: for lensfun-update-data and lensfun-add-adapter')
provides=("$_pkgname=0.3.2")
conflicts=("$_pkgname")
source=("git+https://github.com/lensfun/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		.
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
