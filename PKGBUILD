# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
pkgver=4.2
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64')
url="https://github.com/pyinstaller/pyinstaller"
license=('GPL')
depends=('python-altgraph' 'pyinstaller-hooks-contrib')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-xdist' 'python-pytest-timeout' 'flake8' 'python-flaky')
#              #'pytest-drop-dup-tests' 'python-tinyaes'
optdepends=('python-pycrypto: bytecode encryption support'
            'upx: executable compression support')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f5c0eeb2aa663cce9a5404292c0195011fa500a6501c873a466b2e8cad3c950c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

#check() {
#	cd "$pkgname-$pkgver"

#	# Run only the unit and functional tests, but not the huge library test-suite
#	pytest tests/unit tests/functional -k "not tests/functional/test_libraries.py"
#}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
