# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webdataset'
_name=${pkgname#python-}
pkgver='0.2.100'
pkgrel=1
pkgdesc="Record sequential storage for deep learning."
url="https://github.com/webdataset/webdataset"
depends=(
	python-braceexpand
	python-cbor
	python-cbor2
	python-lmdb
	python-msgpack
	python-pillow
	python-pytorch
	python-pyzmq
	python-torchaudio
	python-torchvision
	python-typeguard
	python-typer
)
makedepends=(python-build python-installer python-wheel)
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('798e30ff700277f0b963dc0395f3b9de4971a67cffc7cb6d0cb9225df7b68e42')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
