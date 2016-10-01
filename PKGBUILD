# Maintainer: Ray Song <i@maskray.me>

pkgname=tmux-fullwidth-backspace
pkgver=2.3
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
md5sums=('fcfd1611d705d8b31df3c26ebc93bd3e'
         '71601bc37fa44e4395580b321963018e'
         '9110efa8524cb8e34c8f7976a11318c1')

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
