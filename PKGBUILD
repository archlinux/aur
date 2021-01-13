# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
pkgname=python-liblarch-git
_name=liblarch
pkgver=3.0.1.r3.g8c90053
pkgrel=1
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://wiki.gnome.org/Projects/liblarch"
license=('LGPL3')
depends=('gtk3' 'python-gobject' 'python-cairosvg')
makedepends=('git' 'python-setuptools')
checkdepends=('python-nose')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/getting-things-gnome/liblarch.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"
	python setup.py build
}

check() {
	cd "$srcdir/$_name"
	python run-tests
}

package() {
	cd "$srcdir/$_name"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
