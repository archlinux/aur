# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("nabi-git")
_gitname="nabi"
pkgver=20140519.786.f3276ce
pkgrel=2
pkgdesc="Nabi - The Easy Hangul XIM"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
url="http://code.google.com/p/nabi/"
license=("GNU GPL v2")
depends=("gtk2" "libhangul>=0.1.0")
provides=("nabi") 
conflicts=("nabi")
source=("${_gitname}::git+https://github.com/choehwanjin/nabi.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git log -1 --format="%cd" --date=short | sed "s/-//g").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
	./autogen.sh
}

build() {
	cd "${srcdir}/${_gitname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}/" install
}
