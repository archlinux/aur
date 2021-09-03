# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-win
pkgname=python-$_pyname
pkgver=5.5.0
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
md5sums=('7f9579f2342d4947e70885dc8e68113f')
sha256sums=('ce555463d3ce0b7b0a66ed25c6dd90797b5ee3fb8fc073336af3fb751fa6338a')
sha512sums=('bc980d973f5089c1328095b6edfaabf2435df3acbca543a768dbbccc8a10ffce4405c54c7711d2c7fa55c40442fa4b116f2e2d40ad4116b1c8bb96ace3450335')

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
