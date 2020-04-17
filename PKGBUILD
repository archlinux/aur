# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=libqtolm-git
pkgver=3.0.1.r0.g750ae3a
pkgrel=1
pkgdesc='A Qt wrapper for libolm'
url='https://gitlab.com/b0/libQtOlm'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libolm')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://gitlab.com/b0/libQtOlm.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=True
	make -C build
}

package() {
	cd "$srcdir/$pkgname"
	make -C build DESTDIR="$pkgdir" install
}
