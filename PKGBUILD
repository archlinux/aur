# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-willow'
_name=willow
pkgver='1.8.0'
pkgrel=1
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-defusedxml' 'python-django' 'python-filetype' 'python-numpy' 'python-pillow')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ef3df6cde80d4914e719188147bef1d71c240edb118340e0c5957ecc8fe08315')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
