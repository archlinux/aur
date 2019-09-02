# Maintainer: Ian Douglas Scott <ian@iandouglasscott.com>

pkgname=rpython
pkgver=0.2.1
pkgrel=1
pkgdesc="Restricted python compiler"
url="http://pypy.org"
arch=('any')
depends=('python2' 'python2-setuptools' 'python2-pytest')
license=('MIT')
source=("https://pypi.python.org/packages/source/r/rpython/rpython-${pkgver}.tar.gz")
md5sums=('07b38960ceb4ae9bb10ab99ceedef888')

prepare() {
	cd ${pkgname}-$pkgver
	# Put cache in writable location
	sed -i "s|os.path.realpath(os.path.join(MAINDIR, '_cache'))|os.path.expanduser('~/.cache/rpython')|" rpython/config/translationoption.py
}

build() {
	cd ${pkgname}-$pkgver
	python2 setup.py build
}

package() {
	cd ${pkgname}-$pkgver
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
