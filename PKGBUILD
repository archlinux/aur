# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=par2cmdline-git
_gitname='par2cmdline'
pkgver=20230126.0b266b5
pkgrel=1
pkgdesc="A file verification and repair tool"
url="https://github.com/BlackIkeEagle/par2cmdline"
license=("GPL")
makedepends=('git')
depends=('gcc-libs')
arch=('x86_64')
provides=('par2cmdline')
conflicts=('par2cmdline')
source=("$_gitname::git+https://github.com/BlackIkeEagle/par2cmdline.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
	msg "Starting make..."
	cd ${_gitname}

	# automake
	aclocal
	automake --add-missing
	autoconf
	# configure
	./configure --prefix=/usr
	# make
	make
}

check() {
	cd ${_gitname}
	export MAKEFLAGS="-j1"
	make check
}

package() {
	cd ${_gitname}
	make DESTDIR=$pkgdir install
}
