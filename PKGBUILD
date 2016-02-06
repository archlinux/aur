# Maintainer: Andrei G. Florea <andrei91ro at gmail dot com>

pkgname=kilombo-git # '-bzr', '-git', '-hg' or '-svn'
pkgver="v0.1.r177.83c55c7"
pkgrel=1
pkgdesc="Kilobot simulator in C"
arch=('i686' 'x86_64')
url="https://github.com/JIC-CSB/kilombo"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake' 'sdl' 'jansson' 'check') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('avr-gcc: c compiler for the AVR microcontroller, to compile for the kilobot')
#install=
source=('git+https://github.com/JIC-CSB/kilombo.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

#prepare() {
	#cd "$srcdir/${pkgname%-VCS}"
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
#}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..

	make
}

#check() {
	#cd "$srcdir/${pkgname%-git}"
	#make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install

    # add license
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
