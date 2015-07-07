# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-pydenticon
pkgname=($pkgbase python2-pydenticon)
pkgver=0.2
pkgrel=1
pkgdesc='Library for generating identicons, port of Sigil with enhancements'
license=('BSD')
arch=('any')
url='https://pypi.python.org/pypi/pydenticon/'
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/pydenticon/pydenticon-${pkgver}.tar.gz")
md5sums=('5786b139933f0c6dcc6ae6c6e6d58de9')

prepare() {
	chmod -R go=u-w "pydenticon-$pkgver" # files in the source tarball have weird permissions
	cp -a "pydenticon-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/pydenticon-$pkgver"
	python setup.py build

	cd "$srcdir/pydenticon-$pkgver-python2"
	python2 setup.py build
}

package_python-pydenticon() {
	depends=('python' 'python-pillow')

	cd "pydenticon-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pydenticon() {
	depends=('python2' 'python2-pillow')

	cd "pydenticon-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
