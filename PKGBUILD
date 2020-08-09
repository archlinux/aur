# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
pkgver=4.0
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('i686' 'x86_64')
url="https://github.com/pyinstaller/pyinstaller"
license=('GPL')
depends=('python-altgraph' 'pyinstaller-hooks-contrib')
makedepends=('python-setuptools')
#checkdepends=('python-pycrypto' 'python-pytest-xdist' 'python-pytest-timeout'
#              'python-psutil' 'python-lxml') #'python-flake8-diff'
optdepends=('python-pycrypto: bytecode encryption support'
            'upx: executable compression support')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz" #{,.asc})
        "https://keys.openpgp.org/vks/v1/by-fingerprint/B943509D633E80DD27FC4EED634A8DFFD3F631DF")
sha256sums=('970beb07115761d5e4ec317c1351b712fd90ae7f23994db914c633281f99bab0'
            'cafd68eb7cdafa4717e7bf577e7edf2da5175669bc53258a5cff99846889dfe5')
validpgpkeys=('B943509D633E80DD27FC4EED634A8DFFD3F631DF')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

#check() {
#	cd "$pkgname-$pkgver"
#
#	# Run only the unit and functional tests, but not the huge library test-suite
#	pytest tests/unit tests/functional -k "not tests/functional/test_libraries.py"
#}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
