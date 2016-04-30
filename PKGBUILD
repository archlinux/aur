# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.11
pkgrel=1
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=('glibc' 'libyaml')
makedepends=('cloudabi' 'cmake')
source=("https://github.com/NuxiNL/cloudabi-utils/archive/v$pkgver.tar.gz")
sha512sums=('bf4224ee7321918e9175f6f492369709473b4bf75ef5e420723e2f88fdc48f48d0ae907dd3b74fc6805756afd9b44e7a8139510e0caa5e58626392eba2a2d9bb')

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
