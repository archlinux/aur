# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=castellan
pkgname=python-$_pyname
pkgver=3.8.0
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
md5sums=('13cacafd236ac68567e1cc401fb94b4e')
sha256sums=('5ef32b23a65c8d7487db5ce2c272383b4656a77da736ea41a28b00ce28d225e4')
sha512sums=('9048633b8cbc4d4beb8bf842a0cdb0f47ea35efcd97df95f0b7fa5beed97fc3b4ee07fae1b2769b372b4df3e900336b6728b689dedae4ade584c76fa566a21ee')

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
