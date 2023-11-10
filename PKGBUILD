# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webdataset'
_name=${pkgname#python-}
pkgver='0.2.75'
pkgrel=1
pkgdesc="Record sequential storage for deep learning."
url="https://github.com/webdataset/webdataset"
depends=('python-msgpack' 'python-pillow' 'python-pytorch' 'python-simplejson' 'python-six' 'python-torchvision' 'python-pyzmq')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d91535d7727cf30079e5531d74fd004525637d1106863c077c1e053dd874716c')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
