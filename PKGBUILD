# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-utils
pkgver=0.8
pkgrel=1
pkgdesc="a number of libraries and utilities that can be used to easily start CloudABI programs"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('GPL')
depends=('glibc' 'libyaml')
makedepends=('cmake')
source=("https://github.com/NuxiNL/cloudabi-utils/archive/v$pkgver.tar.gz")
sha512sums=(
	'5409323c51b52440c665e355f7cde76024f4140fea8e5482a5c46927120ab97ed7b770cb2ebc587397f07b30f424072ed6548ca94aaaa28929473368315fc28c'
)

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
