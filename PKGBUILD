# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.8
pkgrel=2
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=('glibc' 'libyaml')
makedepends=('cmake')
source=("https://nuxi.nl/distfiles/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('fcfbbe5fa3e75d21f8fa4bd3988221ac4704ea6c6ed0f98abea40c04de7604c2f362ebfce835c3c9e0cf0e49c1fb8ae1d824dfce48b6c7f9842f0487ea742fc3')

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
