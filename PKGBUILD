# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=castellan
pkgname=python-$_pyname
pkgver=3.9.1
pkgrel=1
pkgdesc="Generic Key Manager interface for OpenStack"
arch=(any)
url="https://opendev.org/openstack/castellan"
license=(Apache)
depends=(
	python
	python-pbr
	python-cryptography
	python-barbicanclient
	python-oslo-config
	python-oslo-context
	python-oslo-i18n
	python-oslo-log
	python-oslo-utils
	python-stevedore
	python-keystoneauth1
	python-requests
)
checkdepends=(
	python-hacking
	python-pyflakes
	python-coverage
	python-barbicanclient
	python-subunit
	python-oslotest
	python-stestr
	python-fixtures
	python-testscenarios
	python-testtools
	bandit
	python-pifpaf
	python-pre-commit
)
makedepends=(
	python
	python-pbr
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ef123b7c4fef829c251f59326bb03bb8')
sha256sums=('4cb23a5e1640b4b9aa683490c86e4778883db6f553c559b31c65b2cf25969c10')
sha512sums=('6cf489307c8bc74922297d51305f37668c1118c3f22607bed455cb37a515709cd161203f024fe289c0a99225957365e0cb39eca0945d135b0a6e03872241d009')

export PBR_VERSION=$pkgver

build(){
	pushd $_pyname-$pkgver
	python setup.py build
}

check(){
	pushd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
