# $Id$ 

_pkgbasename=libedit
pkgname=lib32-libedit
_pkgver=20150325-3.1
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='Command line editor library providing generic line editing, history, and tokenization functions (32-bit)'
url='http://www.thrysoee.dk/editline/'
arch=('x86_64')
license=('BSD')
depends=('lib32-glibc' 'lib32-ncurses' 'libedit')
makedepends=('gcc-multilib')
source=("http://www.thrysoee.dk/editline/libedit-${pkgver/_/-}.tar.gz")
sha1sums=('c5bf50b433ea35f9fc883400cde674556c44af30')

build() {
	export CC="gcc -m32"
	export CCC="g++ -m32"
	export PKK_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd "${srcdir}/${_pkgbasename}-${_pkgver/_/-}"
	./configure --prefix=/usr --enable-widec --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}/${_pkgbasename}-${_pkgver/_/-}"
	make install DESTDIR="${pkgdir}"

	rm -rf "${pkgdir}"/usr/{include,share,bin}
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/libedit/LICENSE.x86

}
