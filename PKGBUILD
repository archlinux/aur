# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=libdivecomputer-git
pkgver=0.7.0.r23.g75f260a
pkgrel=1
epoch=1
pkgdesc='Library for communication with dive computers'
url='https://www.libdivecomputer.org/'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
provides=('libdivecomputer.so=0-64')
conflicts=('libdivecomputer')
source=("$pkgname::git+https://github.com/libdivecomputer/libdivecomputer")
sha1sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	autoreconf -i
	./configure \
		--prefix=/usr \
		--program-prefix="libdivecomputer-"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="${pkgdir}" install
}
