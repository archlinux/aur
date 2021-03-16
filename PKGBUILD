# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=castellan
pkgname=python-$_pyname
pkgver=3.7.1
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
md5sums=('1d5f21a1d503a2213559aca139c282fc')
sha256sums=('c6ea28b41e4c75fbb1945145b2516f6f9750f8405d2b01efc7c5681286137447')
sha512sums=('f218a55e1e536a22722bbaa66c50eb80efdb39be728d7852d03b6c30cc6587de055fb68cc2add10f68afa950658f03fe8495f792fd37e5d29caa2687e0753f3d')

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
