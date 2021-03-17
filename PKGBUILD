# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=microversion-parse
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=1.0.1
pkgrel=1
pkgdesc="OpenStack microversion header parser"
arch=(any)
url="https://docs.openstack.org/microversion-parse/latest/"
license=(Apache)
depends=(
	python
	python-webob
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
)
checkdepends=(
	python-hacking
	python-coverage
	python-stestr
	python-testtools
	python-gabbi
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('57c6d82f0eb92306d47f1d1933810be5')
sha256sums=('ec6bc0711019f620d6690087b958f934634a242e49a7c1c60c1688363cbe102d')
sha512sums=('25d6894cc65598e6215de2d6e256d26433bcb337e1f8c5dd7075c644adbf2e89feb38d08bc0522573ed8884c2734e83bcf5d0bec6292ecb44615deb18190cadc')

build(){
	cd $_pycname-$pkgver
	python setup.py build
}

check(){
	cd $_pycname-$pkgver
	stestr run
}

package(){
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
