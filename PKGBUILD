# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fdutil
pkgver=1.16.0
pkgrel=1
pkgdesc="Collection of Python utilities for manipulating files and data"
url="https://bitbucket.org/davisowb/fdutil"
arch=('any')
license=('MIT')
depends=(
	'python-future>=0.16.0'
	'python-ruamel-yaml>=0.15.35'
	'python-pyperclip>=1.5.27'
	'python-logging-helper>=1.7.0' ## AUR
	'python-configurationutil>=3.7.0' ## AUR
	'python-conversionutil>=1.1.0' ## AUR
	'python-stateutil>=1.4.0' ## AUR
	'python-watchdog>=0.8.3'
	'python-dominate>=2.3.1')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fdutil/fdutil-$pkgver.tar.gz")
sha256sums=('990da8f8012aeb9dcf7db82e56d9cfd9644a43e9655e424de7b9db2a91134538')

build() {
	cd "fdutil-$pkgver"
	python -m setuptools.launch setup.py build
}

package() {
	cd "fdutil-$pkgver"
	PYTHONHASHSEED=0 python -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
