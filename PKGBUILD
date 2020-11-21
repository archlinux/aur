# Maintainer: <hxss@ya.ru>
pkgname='folderpreview-git'
pkgver=0.3.0.r1.gc46d126
pkgrel=1
pkgdesc='Generates folder preview thumb'
arch=('any')
url='https://gitlab.com/hxss-linux/folderpreview'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('folderpreview')
source=("$pkgname::git+https://gitlab.com/hxss-linux/folderpreview")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	mkdir -p $pkgdir/usr/share/thumbnailers/
	cp folderpreview.thumbnailer $pkgdir/usr/share/thumbnailers/
}
