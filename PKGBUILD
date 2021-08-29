# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=automaton
pkgname=python-$_pyname
pkgver=2.4.0
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
md5sums=('37826e9151ec9a4b4fabead3d5745006')
sha256sums=('650c9b9e1155924dba7655fb4a303911e30a2606ea9303a9ebf95152d2ddcf19')
sha512sums=('e399fd12fd883112d49aff0d092fbc2b51952a24e3b40eae47d0bd7f5e2648689ab76413a2d404ef686ce5622e4661db1beb3e44a690c5c0279b85f69d267ecd')

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
