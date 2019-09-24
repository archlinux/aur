# Maintainer: Oliver Hattshire <hattshire@gmail.com>
# Contributor: -

pkgname=lexbor-git
pkgver=0.2.0.r56.gf56cb7f
pkgrel=1

pkgdesc="Web browser engine library with no extra dependencies."
url="https://lexbor.com/"
license=('APACHE')

arch=(x86_64)
depends=('glibc')
makedepends=('cmake' 'git' 'make' )
options=(staticlibs)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/lexbor/${pkgname%-git}.git")
md5sums=(SKIP)

########

pkgver() {
	cd "$srcdir/${pkgname%-git}/"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-git}-$pkgver.patch"
#}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLEXBOR_BUILD_TESTS=ON .
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

