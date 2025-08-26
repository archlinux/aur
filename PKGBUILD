# Maintainer: Felipe Marinho <felipevm97@gmail.com>

pkgname=musnify-mpd
pkgver=1.3
pkgrel=1
pkgdesc="Provides notification support for Music Player Daemon using libnotify"
arch=("any")
url="https://github.com/felipemarinho97/musnify-mpd"
license=('GPL')
depends=("python" "python-requests" "python-mpd2" "python-gobject" "libnotify")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/felipemarinho97/musnify-mpd/archive/$pkgver.tar.gz")
md5sums=("b6e9fe6c9d2d9ad8fd9cc34aee4e576f")

prepare() {
	cd "$pkgname-$pkgver"
}



package() {
	install -dm755 "$pkgdir"/{etc,usr/{bin,share/doc/musnify-mpd}}

	_SRC="$srcdir/$pkgname-$pkgver"

	echo "#!$(which python)" >> $_SRC/musnify-mpd && cat $_SRC/musnify-mpd.py >> $_SRC/musnify-mpd
	mv $_SRC/musnify-mpd $pkgdir/usr/bin/musnify-mpd
	chmod 755 $pkgdir/usr/bin/musnify-mpd

	cp $_SRC/musnify-mpd.config $pkgdir/etc/musnify-mpd.config

	cp $_SRC/doc/musnify-mpdconfig.example $pkgdir/usr/share/doc/musnify-mpd/musnify-mpdconfig.example
	chmod 644 $pkgdir/usr/share/doc/musnify-mpd/musnify-mpdconfig.example

	cp $_SRC/README.md $pkgdir/usr/share/doc/musnify-mpd/README.md

}
