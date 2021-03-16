# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-api-ref
pkgname=python-$_pyname
pkgver=2.1.0
pkgrel=1
pkgdesc="Sphinx Extensions to support API reference sites in OpenStack"
arch=('any')
url="https://docs.openstack.org/os-api-ref/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-pyaml
	python-six
	python-sphinx
	python-openstackdocstheme
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-testrepository
	python-testtools
	python-sphinx-testing
	python-beautifulsoup4
	python-stestr
)
makedepends=(
	python
	python-setuptools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('b3b4d24e171cac01df12e1cc12759c64')
sha256sums=('d89133f36e4ba187408d851ab2e0f1c8419877ca928af6f63a390e721b367798')
sha512sums=('b006b9cc98221d570a838573783242438563f8d67be5ddcfaaf864210955c7f8170a9cdff3d4ea0f4a29769ca6aeafa18b09f95a1c25670629ab9c0dfee92eca')

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
