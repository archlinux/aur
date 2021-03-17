# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zvmcloudconnector
_pycname=zVMCloudConnector
pkgname=python-$_pyname
pkgver=1.4.1
pkgrel=1
pkgdesc="z/VM cloud management library in Python"
arch=(any)
url="https://github.com/mfcloud/python-zvm-sdk"
license=(Apache)
depends=(
	python
	python-jsonschema
	python-netaddr
	python-pyjwt
	python-requests
	python-routes
	python-six
	python-webob
)
makedepends=(python-setuptools)
checkdepends=(
	python-mock
	python-subunit
	python-pyaml
	python-pytest
	python-sphinx
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('db19aec9bc5ae0f5cfeb80439ad53898')
sha256sums=('f24a37d5a0206e791398b6e7ae4698255cc6fa6e1d23548128259711b79ce7bf')
sha512sums=('206776bd04ef547df530438efe6209db7374c33727d13269f6f3632aa69c74713b358e628dc4fab8afc6657ac65a17bd2ec4c6f2984385de2187581fd734e65c')

build(){
	cd $_pycname-$pkgver
	python setup.py build
}

check(){
	cd $_pycname-$pkgver
	python -m pytest
}

package(){
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mv $pkgdir{,/usr}/lib/systemd
	rmdir $pkgdir/lib
}
