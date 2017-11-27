pkgname=nbmanager-git
_gitname=nbmanager
pkgver=43.c90aac4
pkgrel=1
pkgdesc='A GUI to view and manager running IPython notebook servers'
arch=(any)
url='https://github.com/takluyver/nbmanager'
license=(BSD)
makedepends=(git)
depends=(python python-pyqt5 jupyter python-qtico)
provides=(nbmanager ipython-nbmanager)
conflicts=(nbmanager ipython-nbmanager)
source=("git://github.com/takluyver/nbmanager.git")
md5sums=(SKIP)

pkgver() {
	cd $_gitname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$_gitname"
	
	python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	
	install -Dm644 jupyter-nbmanager.desktop "$pkgdir/usr/share/applications/jupyter-nbmanager.desktop"
	for icon in icons/hicolor/*/apps/jupyter-nbmanager.*; do
		install -Dm644 $icon "$pkgdir/usr/share/$icon"
	done
}
