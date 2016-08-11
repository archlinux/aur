# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.15
pkgrel=1
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=('glibc' 'libyaml')
makedepends=('cloudabi' 'cmake')
source=("https://github.com/NuxiNL/cloudabi-utils/archive/v$pkgver.tar.gz")
sha512sums=('b8ce6236f89900caec1f5634785c3ef4f87d81c24da749d2b4dd0475a435fd6238c88e0841379e8e84b7af53fa4505db7b104cd4ebbf7fcbc44e656c2b8fa6d3')

prepare() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/cloudabi-utils-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname"
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
}
