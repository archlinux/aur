# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-willow'
_name=willow
pkgver='1.9.0'
pkgrel=1
pkgdesc="A Python image library that sits on top of Pillow, Wand and OpenCV"
url="https://www.sphinx-needs.com/"
depends=('python-defusedxml' 'python-django' 'python-filetype' 'python-numpy' 'python-opencv' 'python-pillow' 'python-wand')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ffac1406275ae30b60e7c6cbd1245f0bc359d1b5731002b18a712aaf424a5102')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
