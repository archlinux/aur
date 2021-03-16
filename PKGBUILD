# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.upgradecheck
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=1.3.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=('any')
url="https://docs.openstack.org/oslo.upgradecheck/latest/"
license=('Apache')
depends=(
	python
	python-oslo-config
	python-oslo-i18n
	python-prettytable
	python-oslo-utils
	python-oslo-policy
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-oslotest
	python-stestr
	python-pre-commit
	python-oslo-serialization
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('d4b51767f8ac8d0317352e914ba98a96')
sha256sums=('110151a214cfe41219b3b1cef980d32036e3460b332a431435e1d1cc84590588')
sha512sums=('77f26cba33b1a3075c3de51fc393b65272c01e6d59bc315304a439cb95d104b7596cbd007409e18e98a5e28f90b4d4e67b59680a578bffb840795e11b56bcf76')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=$PWD stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
