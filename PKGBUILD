# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.6.3
pkgrel=1
pkgdesc="CMake is a cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('expat' 'xmlrpc-c')
makedepends=('qt')
optdepends=('qt: cmake-gui')
source=("http://www.cmake.org/files/v2.6/$pkgname-$pkgver.tar.gz")
md5sums=('5ba47a94ce276f326abca1fd72a7e7c6')

build() {
	cd $srcdir/$pkgname-$pkgver
	./bootstrap --prefix=/usr \
		--mandir=/share/man \
		--docdir=/share/doc/cmake \
		--system-libs \
		--qt-gui
	make || return 1
	make DESTDIR=$pkgdir install

	install -D -m644 Docs/cmake-indent.vim $pkgdir/usr/share/vim/indent/cmake-indent.vim
	install -D -m644 Docs/cmake-syntax.vim $pkgdir/usr/share/vim/syntax/cmake-syntax.vim
	install -D -m644 Docs/cmake-mode.el $pkgdir/usr/share/emacs/site-lisp/cmake-mode.el
	install -D -m644 Copyright.txt $pkgdir/usr/share/licenses/$pkgname/Copyright.txt	
}
