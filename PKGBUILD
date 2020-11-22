# Maintainer: <hxss@ya.ru>
appname='folderpreview'
pkgname="${appname}-git"
pkgver=0.3.0.r1.gc46d126
pkgrel=2
pkgdesc='Generates folder preview thumb'
arch=('any')
url='https://gitlab.com/hxss-linux/folderpreview'
license=('MIT')
depends=(
	'python-dbus-next'
	'python-pyxdg'
	'python-yaml'
	'python-gobject'
	'python-parse'
	'python-colorlog'
	'libvips'
)
makedepends=(
	'python-pip'
)
install='folderpreview.install'
provides=($appname)
conflicts=($appname)
source=('git+https://gitlab.com/hxss-linux/folderpreview')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$appname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$appname"
	python setup.py build
}

package() {
	cd "$srcdir/$appname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 folderpreview.thumbnailer -t "$pkgdir/usr/share/thumbnailers"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

