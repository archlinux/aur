# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Your Name <max at maxbruckner dot de>
pkgname=gtk-vector-screenshot
pkgver=0.3.3
_filename="$pkgname-$pkgver"
pkgrel=1
pkgdesc="A GTK module for taking vector graphic screenshots (PDF, SVG and PostScript)"
arch=("i686" "x86_64")
url="https://github.com/nomeata/gtk-vector-screenshot"
license=('LGPL2.1')
depends=("gtk3" "xorg-server")
source=("$_filename::https://github.com/nomeata/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08aeba6e293c8d8fb62173e84cd4ff1b5a0edd89eec97cc839b15a1c8deab260')

prepare() {
	cd "$_filename"
	autoreconf -vif
}

build() {
	cd "$_filename"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_filename"
	make DESTDIR="$pkgdir/" install
	install -D 52load-gtk-vector-screenshot-gtk-module "$pkgdir/etc/X11/xinit/xinitrc.d/52load-gtk-vector-screenshot-gtk-module"
}
