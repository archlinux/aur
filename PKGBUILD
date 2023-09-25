# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-willow'
_name=willow
pkgver='1.6.2'
pkgrel=2
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-defusedxml' 'python-django' 'python-filetype' 'python-numpy' 'python-pillow')
makedepends=('python-setuptools' 'python-flit-core')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e2d0450fd78ab19052d0478b888ef163e3264e8dcd1af002dd691458db98056f')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
