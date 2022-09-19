# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=automaton
pkgname=python-$_pyname
pkgver=3.0.1
pkgrel=1
pkgdesc="Friendly state machines for python."
arch=(any)
url="https://opendev.org/openstack/automaton"
license=(Apache)
depends=(
	python
	python-pbr
	python-prettytable
)
checkdepends=(
	python-coverage
	python-oslotest
	python-stestr
	python-testtools
	python-reno
)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('7801dec36d78c9d532394366749e6a27')
sha256sums=('1004a4787c241a62ccab255c414207b93f5fdc8509a022590d05bdeb3807cb76')
sha512sums=('b9c1c3a4a682604987004c2112d1e22b8ca713f173d2a1a70c5440adbcf42d1c30a41743cb732624f54d636f224d7619bf3b9142f6d310fb3884d987b96111dd')

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
