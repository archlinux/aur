# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname=admbrowser-git
pkgver=r155.da7b945
pkgrel=2
pkgdesc='Web browser for kiosks and digital signage'
arch=('any')
url="https://github.com/alandmoore/admbrowser"
license=('GPL3')
backup=("etc/admbrowser.yaml")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('python-pyqt5' 'python-pyqt5-webengine' 'python-yaml' 'qt5-webkit')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	python setup.py build
}

package(){
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 admbrowser.yaml -t "$pkgdir/etc/"
}
