# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Mara Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.38
pkgrel=2
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=(
	'libyaml'
	'argdata'
	'yaml2argdata'
	'flower'
)
makedepends=('cloudabi' 'cmake')
source=("https://github.com/NuxiNL/cloudabi-utils/archive/v$pkgver.tar.gz")
sha512sums=('6418ec2c9bf008885a7b3936fced6c1a9dbf07ee31567f51b0ac4541a34a99113e7ed3dcf09900dec04d2dc6285b32f7b8322061d6b11fa70ab05b9786040561')
groups=(cloudabi)

prepare() {
	rm -rf "$srcdir/build"
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
