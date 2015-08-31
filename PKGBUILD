# Maintainer: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-git
pkgver=r1596.230c5ff
pkgrel=1
pkgdesc="A new lightweight, easy-to-use, feature-rich email client (beta version)"
arch=(i686 x86_64)
url="http://redmine.yorba.org/projects/geary"
license=('GPL')
depends=('libcanberra' 'gmime' 'libunique3' 'webkitgtk3' 'libgnome-keyring' 'libnotify' 'libgee' 'hicolor-icon-theme' 'desktop-file-utils' 'gobject-introspection')
makedepends=('cmake' 'vala' 'git' 'intltool')
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
