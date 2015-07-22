pkgname=nbmanager-git
_gitname=nbmanager
pkgver=22.a93f2c9
pkgrel=1
pkgdesc='A GUI to view and manager running IPython notebook servers'
arch=(any)
url='https://github.com/takluyver/nbmanager'
license=(BSD)
makedepends=(git)
depends=(python python-pyqt5 ipython)
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
	
	install -Dm644 nbmanager.desktop "$pkgdir/usr/share/applications/nbmanager.desktop"
	for size in 16 32 48 64 128 256 512; do
		install -Dm644 icons/nbmanager-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ipython-nbmanager.png"
	done
	install -Dm644 icons/nbmanager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ipython-nbmanager.svg"
}