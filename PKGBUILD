# Maintainer: UnicornDarkness
# Contributor: Antoine Lubineau <antoine@lubignon.info>

_pkgname=radeontop
pkgname=$_pkgname-git
epoch=1
pkgver=1.0.r6.g07ec134
pkgrel=1
pkgdesc='Radeon cards monitoring utility'
arch=('i686' 'x86_64')
url='https://github.com/clbr/radeontop'
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
makedepends=('git')
provides=('radeontop')
conflicts=('radeontop')
source=('git+https://github.com/clbr/radeontop.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i "s/sbin/bin/" Makefile
}

build() {
	export amdgpu=1
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
