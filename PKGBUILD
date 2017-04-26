# Maintainer: Ray Song <i@maskray.me>

pkgname=tmux-fullwidth-backspace
pkgver=2.4
pkgrel=1
pkgdesc='A terminal multiplexer (patched with support for fullwidth backspace)'
url='http://tmux.github.io/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'libutempter')
source=(https://github.com/tmux/tmux/releases/download/$pkgver/tmux-$pkgver.tar.gz
	LICENSE fullwidth-backspace.patch)
provides=('tmux')
conflicts=('tmux')
md5sums=('6165d3aca811a3225ef8afbd1afcf1c5'
         '71601bc37fa44e4395580b321963018e'
         'd94a3a131ae12cc227cb76b627451d7a')

prepare() {
	cd "$srcdir/tmux-${pkgver/_/}"
	patch -Np1 -i ../fullwidth-backspace.patch
}

build() {
	cd "$srcdir/tmux-${pkgver/_/}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/tmux-${pkgver/_/}"
	make install DESTDIR=$pkgdir
	install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
