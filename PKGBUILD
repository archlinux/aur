# Maintainer: Javier Castro <dev at javiercastro dot com>
# Contributor: Alex Hirzel <alex at hirzel period us>

_name=willow
pkgname=python-${_name}
pkgver='1.12.0'
pkgrel=1
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-defusedxml' 'python-django' 'python-filetype' 'python-numpy' 'python-opencv' 'python-pillow' 'python-wand')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('db29c8d2f19b9d91f4ce22881521055aa2f6070131d64b4098cb86a98e851a70')

prepare() {
    cd "$srcdir/${_name}-$pkgver"

    # Temporary fix to allow building with `flit_core` version 4.
    sed -i 's/flit_core >=3.2,<4/flit_core >=3.2,<5/' pyproject.toml
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
