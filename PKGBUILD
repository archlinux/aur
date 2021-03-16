# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-win
pkgname=python-$_pyname
pkgver=5.4.0
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
md5sums=('89e2eba86f2033c7fe69b56cbb2f6c26')
sha256sums=('142eaa816b1a37abcd9718a1820699cd14b34fa4a16129ddc3a799468682e7ed')
sha512sums=('3c32fef9959e4ba4ac3c511f193e026a079935a3f1cba1bd151ab90de5e2acbb073dcd1172f5ebd0937012f15879b93897eb08b6b811ec2d06df6b69b8cbc2e0')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
