# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=sphinx-feature-classification
pkgname=python-$_pyname
pkgver=1.1.0
pkgrel=2
pkgdesc="Generate a matrix of pluggable drivers and their support to an API in Sphinx."
arch=('any')
url="https://docs.openstack.org/sphinx-feature-classification/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-docutils
	python-sphinx
)
makedepends=(
	python
	python-setuptools
)
checkdepends=(
	python-pytest
	python-hacking
	python-coverage
	python-ddt
	python-subunit
	python-testrepository
	python-testtools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('5bd07ca97ec2b5fd2d9190736f3944ea')
sha256sums=('2b70bd2bcaa87fcb4edd5f9e4d712b661baeb2bf0735deb0d776e6315b69e7d4')
sha512sums=('dedf1a5476fc949f7c18533de03cafaba624545f681e5a20d223a84c6c273c993c2098c385230598c76b785c0ca818a5c220c1226c93c3d561c973647cbb50ad')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	python -m pytest
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
