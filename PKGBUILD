# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=PyDrive
pkgbase=python-pydrive
pkgname=('python-pydrive' 'python2-pydrive')
pkgver=1.3.1
pkgrel=1
pkgdesc="Google Drive API Python wrapper library"
arch=('any')
url="https://github.com/gsuitedevs/PyDrive"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/gsuitedevs/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('75cc44c2d5936559359287bf273c0345165900f7ccf1aba86d9565e7dc6144fc')

prepare() {
	cp -a $_pkgbase-$pkgver{,-python2}
}

build() {
	cd $_pkgbase-$pkgver
	python setup.py build

	cd ../$_pkgbase-$pkgver-python2
	python2 setup.py build
}

package_python-pydrive() {
	depends=('python-google-api-python-client' 'python-oauth2client' 'python-yaml')

	cd $_pkgbase-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}

package_python2-pydrive() {
	depends=('python2-google-api-python-client' 'python2-oauth2client' 'python2-yaml')

	cd $_pkgbase-$pkgver-python2
	python2 setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
