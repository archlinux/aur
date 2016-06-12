# Maintainer: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-git
pkgver=r2330.fcb4df2
pkgrel=1
pkgdesc="A new lightweight, easy-to-use, feature-rich email client (beta version)"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Geary"
license=('GPL')
depends=('libcanberra' 'gmime' 'libunique3' 'webkitgtk3' 'libgnome-keyring' 'libnotify' 'libgee' 'hicolor-icon-theme' 'desktop-file-utils' 'gobject-introspection')
makedepends=('cmake' 'vala' 'git' 'intltool' 'gnome-doc-utils')
provides=('geary')
conflicts=('geary')
install=geary.install
source=('git://git.gnome.org/geary')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/geary"
	printf "r%s.%s" "$(git rev-list --count master)" "$(git rev-parse --short master)"
}

build() {
	cd "$srcdir/geary"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/geary"
	make install DESTDIR="$pkgdir"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
