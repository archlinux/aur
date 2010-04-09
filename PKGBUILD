# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.8.1
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('expat' 'curl' 'gcc-libs' 'shared-mime-info')
makedepends=('qt')
optdepends=('qt: cmake-gui')
install=${pkgname}.install
source=("http://www.cmake.org/files/v2.8/${pkgname}-${pkgver}.tar.gz")
md5sums=('feadc2e5ebbfed0efc90178583503725')

build() {
	cd $srcdir/$pkgname-$pkgver
	./bootstrap --prefix=/usr \
		--mandir=/share/man \
		--docdir=/share/doc/cmake \
		--system-libs \
		--qt-gui \
		--parallel=2
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install

	vimpath="$pkgdir/usr/share/vim/vim72"
	install -Dm644 Docs/cmake-indent.vim $vimpath/indent/cmake-indent.vim
	install -Dm644 Docs/cmake-syntax.vim $vimpath/syntax/cmake-syntax.vim
	install -Dm644 Docs/cmake-mode.el $pkgdir/usr/share/emacs/site-lisp/cmake-mode.el
	install -Dm644 Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
