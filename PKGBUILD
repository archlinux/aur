# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webdataset'
_name=${pkgname#python-}
pkgver='0.2.86'
pkgrel=1
pkgdesc="Record sequential storage for deep learning."
url="https://github.com/webdataset/webdataset"
depends=('python-msgpack' 'python-pillow' 'python-pytorch' 'python-simplejson' 'python-six' 'python-torchvision' 'python-pyzmq')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('373e9324271d26f952d8908a07bfa71afd0d84761fc314d47ddc597c876743d1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
