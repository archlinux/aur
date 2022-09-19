# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=castellan
pkgname=python-$_pyname
pkgver=4.0.0
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
md5sums=('b8a55d74db0c06288eb0bdf5f20deecc')
sha256sums=('11e2245e31f42ff850745d05be662baf836f75ed7f67020059335f410cd503a4')
sha512sums=('af6266808a8125bcb80fb6a3b527e3511b51c952687c3920bfcae5ef6952dae6b4cfd52bda31dda13ccf45fc233604eb03d3e417d9a8af53e8bfeaf9e0d860e4')

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
