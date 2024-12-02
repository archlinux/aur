# Maintainer: Timothy Gu <timothygu99@gmail.com>
# Maintainer: Blyss Sarania <blyss.sarania@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=12.0.0
pkgrel=1
pkgdesc="Python utilities for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD-3-Clause')
depends=('nvidia-utils' 'python' 'python-nvidia-ml-py')
makedepends=('python-build' 'python-installer')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('299ce2451a6a17e6822d6faee750103e25b415f06f59abb8db65d30f794166f5')

# Build the Python wheel
build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation --outdir dist
}

# Install the wheel that was built as well as the license
package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
