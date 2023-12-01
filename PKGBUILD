# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-willow'
_name=willow
pkgver='1.7.0'
pkgrel=1
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-defusedxml' 'python-django' 'python-filetype' 'python-numpy' 'python-pillow')
makedepends=('python-setuptools' 'python-flit-core')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2202ac8852d24312b4d71a4ef9f75f813c8799d440f58e905f055ea4a220c1b1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
