# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=openocd-riot-git
pkgver=r8239.16d64a2c
pkgrel=1
pkgdesc="Open On-Chip Debugger with RIOT support"
arch=(x86_64)
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make' 'gcc' 'libtool' 'pkg-config' 'autoconf' 'automake' 'texinfo' 'libusb')
provides=("openocd-riot" "openocd")
conflicts=("openocd-riot" "openocd")
source=('openocd::git+https://github.com/seeseemelk/openocd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/openocd"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/openocd"
	./bootstrap
	./configure --prefix=/usr CPPFLAGS="-Wno-maybe-uninitialized -Wno-error=cpp"
	make
}

package() {
	cd "$srcdir/openocd"
	make DESTDIR="$pkgdir/" install
}
