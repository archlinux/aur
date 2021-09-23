# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=bashate
pkgname=python-$_pyname
pkgver=2.1.0
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=(any)
url="http://docs.openstack.org/developer/bashate/"
license=(Apache)
depends=(
	python
	python-pbr
)
makedepends=(
	python
	python-fixtures
	python-sphinx
	python-openstackdocstheme
	python-reno
	python-setuptools
)
checkdepends=(
	python-testtools
	python-stestr
	python-subunit
	python-coverage
	python-discover
	python-hacking
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e910cde1c80a2518eec647a6110bae2e')
sha256sums=('a0df143639715dc2fb6cf9aa6907e4a372d6f0a43afeffc55c5fb3ecfe3523c8')
sha512sums=('6ef17da86113195d8dae093fddb7c17a365b4cd7816ef0ebb98ac6cda61f52526092f7da6c39c11fba9d709a124970e18e93e267f7d0fb38190e313208f66e98')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
