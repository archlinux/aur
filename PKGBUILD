# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webdataset'
_name=${pkgname#python-}
pkgver='0.2.79'
pkgrel=1
pkgdesc="Record sequential storage for deep learning."
url="https://github.com/webdataset/webdataset"
depends=('python-msgpack' 'python-pillow' 'python-pytorch' 'python-simplejson' 'python-six' 'python-torchvision' 'python-pyzmq')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a8ef8809e8c6b32423e40811a529b76a0799d93e3eba1bd1671640906a5fe138')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
