# Maintainer: Cezary Drożak <cezary at drozak dot net>

_pkgname=bake
pkgname=$_pkgname-git
pkgver=2.5.1.r127.g34990d3
pkgrel=1
pkgdesc='A build system that lets you clone, build and run C/C++ projects with a single command'
arch=('x86_64')
url='https://github.com/SanderMertens/bake'
license=('GPL3')
depends=()
makedepends=('git' 'make')
source=("$_pkgname::git+https://github.com/SanderMertens/bake.git")
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make -C build-Linux all
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 bake -t "$pkgdir/usr/bin"
}
