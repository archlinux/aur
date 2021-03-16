# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.cache
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.7.0
pkgrel=1
pkgdesc="Cache storage for OpenStack projects."
arch=('any')
url="https://docs.openstack.org/oslo.cache/latest"
license=('Apache')
depends=(
	python
	python-dogpile.cache
	python-oslo-config
	python-oslo-i18n
	python-oslo-log
	python-oslo-utils
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-oslotest
	python-pifpaf
	bandit
	python-stestr
	python-pre-commit
	python-pymemcache
	python-binary-memcached
	python-memcached
	python-pymongo
	python-etcd3gw
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('012c54f8779cd416792554a65cb6573c')
sha256sums=('aad244c3cc38b86d610166bd2979e01acb59201f173d7069fa4a0a8bcb153520')
sha512sums=('27cb541cb60247b69fc291278dce5c3828daa7914e2b9787882066c66ffa69629c0232ac7e3ad0388ddda414fe5c3d1ab52df075a3ac168c95751827408f1fb0')

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
	python setup.py install --root="$pkgdir/" --optimize=1
}
