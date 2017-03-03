# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.22
pkgrel=2
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=('glibc' 'libyaml' 'argdata')
makedepends=('cloudabi' 'cmake')
source=("https://github.com/NuxiNL/cloudabi-utils/archive/v$pkgver.tar.gz")
sha512sums=('595e215e8fc34bc2da436a7eb10dfd11dde8b15ba27a9db6c8e7ceee093d5aa84a1f8f35a6c2250cd1f92266b6573c3d964d532f36f38f78b9da5bf18a1a856c')

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
