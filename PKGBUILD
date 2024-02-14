# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=tmux-sixel
pkgver=3.4
pkgrel=1
pkgdesc='Terminal multiplexer, with sixel support'
url='https://github.com/tmux/tmux/wiki'
arch=('x86_64')
license=('BSD')
depends=('libevent' 'libevent_core-2.1.so'
         'libsixel'
         'libutempter'
         'ncurses' 'libncursesw.so'
         'systemd-libs' 'libsystemd.so')
makedepends=('systemd')
conflicts=('tmux')
replaces=('tmux')
source=("https://github.com/tmux/tmux/releases/download/${pkgver/_/}/tmux-${pkgver/_/}.tar.gz")
sha256sums=('551ab8dea0bf505c0ad6b7bb35ef567cdde0ccb84357df142c254f35a23e19aa')

build() {
	cd "tmux-${pkgver/_/}"

	./configure \
		--prefix=/usr \
		--enable-sixel \
		--enable-systemd \
		--enable-utempter
	make
}

package() {
	cd "tmux-${pkgver/_/}"

	make install DESTDIR="$pkgdir"
	install -D -m0644 COPYING "$pkgdir/usr/share/licenses/tmux/LICENSE"
}
