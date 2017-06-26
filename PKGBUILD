# Maintainer: Ray Song <i@maskray.me>

pkgname=tmux-fullwidth-backspace
pkgver=2.5
pkgrel=3
pkgdesc='A terminal multiplexer (patched with support for fullwidth backspace)'
url='http://tmux.github.io/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'libutempter')
source=(https://github.com/tmux/tmux/releases/download/$pkgver/tmux-$pkgver.tar.gz
	LICENSE fullwidth-backspace.patch)
provides=('tmux')
conflicts=('tmux')
sha256sums=('ae135ec37c1bf6b7750a84e3a35e93d91033a806943e034521c8af51b12d95df'
            'b5de80619e4884ced2dfe0a96020e85dcfb715a831ecdfdd7ce8c97b5a6ff2cc'
            'd511b1dd6f4907e3aaaa382d0e149963b256736be275c49d318a5d6320b689f9')

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
	make install DESTDIR="$pkgdir"
	install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
