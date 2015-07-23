# $Id: PKGBUILD 106145 2014-02-24 08:39:29Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>

pkgname=tmux1.8
pkgver=1.8
pkgrel=1
pkgdesc='A terminal multiplexer - Legacy version 1.8, the last version that support grid-style navigation'
url='http://tmux.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
provides=("tmux=$pkgver")
conflicts=('tmux')
depends=('ncurses' 'libevent')
source=(http://downloads.sourceforge.net/tmux/tmux-${pkgver/_/}.tar.gz
		LICENSE)
md5sums=('b9477de2fe660244cbc6e6d7e668ea0e'
         '71601bc37fa44e4395580b321963018e')

build() {
	cd "$srcdir/tmux-${pkgver/_/}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/tmux-${pkgver/_/}"
	make install DESTDIR=$pkgdir
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"

	install -dm755 "$pkgdir/usr/share/tmux/"
	install -m644 examples/* "$pkgdir/usr/share/tmux/"
	install -Dm644 examples/tmux.vim "$pkgdir/usr/share/vim/vimfiles/syntax/tmux.vim"

	install -d $pkgdir/usr/share/bash-completion/completions/
	mv $pkgdir/usr/share/tmux/bash_completion_tmux.sh $pkgdir/usr/share/bash-completion/completions/tmux
}
