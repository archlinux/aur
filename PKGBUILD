# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=kregexpeditor-git

pkgver=491.f618b59
pkgrel=1
pkgdesc="KDE editor for regular expressions"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/playground/utils/kregexpeditor"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('git' 'cmake' 'automoc4')
provides=('kregexpeditor')
conflicts=('kregexpeditor')
replaces=('kregexpeditor-svn')
install=kregexpeditor.install

source=('git://anongit.kde.org/kregexpeditor')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/kregexpeditor"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/kregexpeditor"

	rm -rf "$srcdir/build"
	cp -R "$srcdir/kregexpeditor" "$srcdir/build"
	cd "$srcdir/build"

	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
