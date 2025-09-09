# Maintainer: Timothy Gu <timothygu99@gmail.com>
# Maintainer: Blyss Sarania <blyss.sarania@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=13.0.1
pkgrel=1
pkgdesc="Python utilities for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD-3-Clause')
depends=('nvidia-utils' 'python' 'python-nvidia-ml-py')
makedepends=('python-build' 'python-installer')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1245991d9db786b4d2f277ce66869bd58f38ac654e38c9397d18f243c8f6e48f')

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
