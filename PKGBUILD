# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-xenapi
pkgname=python-$_pyname
pkgver=0.3.4
pkgrel=1
pkgdesc="XenAPI library for OpenStack projects"
arch=(any)
url="http://www.citrix.com/"
license=(Apache)
depends=(
	python
	python-pbr
	python-babel
	python-eventlet
	python-oslo-concurrency
	python-oslo-log
	python-oslo-utils
	python-oslo-i18n
	python-paramiko
	python-six
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-sphinx
	python-oslosphinx
	python-oslotest
	python-os-testr
	python-testrepository
	python-testscenarios
	python-testtools
	python-reno
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e1023c66411893c0d512fb227ae63b5c')
sha256sums=('85d9d4bff4086a9c36eb9b2b9dfce542fa8336821a63826180dc0e8637e8ad72')
sha512sums=('4e5afbce07d38f93e93ac839eb26927a2436b33a39e14a57ed1e99cbd3501c7d2dec8db7f65617c8d6308e8227e60f5653102ac3a04d9322c0791040fa3f22a9')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	ostestr --color --slowest --blacklist_file exclusion_py3.txt
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
