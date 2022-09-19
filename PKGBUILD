# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-win
pkgname=python-$_pyname
pkgver=5.7.1
pkgrel=1
pkgdesc="Windows / Hyper-V library for OpenStack projects."
arch=(any)
url="http://www.cloudbase.it/"
license=(Apache)
depends=(
	python
	python-pbr
	python-eventlet
	python-oslo-concurrency
	python-oslo-config
	python-oslo-log
	python-oslo-utils
	python-oslo-i18n
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-coverage
	python-ddt
	python-oslotest
	python-stestr
	python-testscenarios
	python-testtools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('04f90d16c9131fc0fe0bfae336de922d')
sha256sums=('d60ac38edf400e3ae831394697708cc95a5f1788067752d96fa5cba3674f30ca')
sha512sums=('ea36fc99c215c9867c3620919cf62ec4634356dd53bcaca247a8b6330e32085c0b119df2d458b1262d9fc6a017f711033d8f583ba597bd95837e32054ac4eb9a')

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
