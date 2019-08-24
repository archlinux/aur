# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-pypocketfft
_pkgname='pypocketfft'
pkgver=0.0.1
# Unfortunately, upstream does not tag releases; just use the latest commit for now as done in the instruction material
_commit='c0f74f610adfc60b8b5e3c3bce6477e646329f63'
pkgrel=1
pkgdesc="Fast Fourier, trigonometric and Hartley transforms with a simple Python interface"
arch=('any')
license=('BSD 3-clause "New" or "Revised" License')
url="https://gitlab.mpcdf.mpg.de/mtr/pypocketfft"
depends=('python' 'python-numpy' 'pybind11')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://gitlab.mpcdf.mpg.de/mtr/${_pkgname}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('3957e4b1e1b28979d30b32f74dba17e9f26c3ca38f2c909c1b8b445f9fff8cbb04a27b81a31200d4c8b41ad1c7310eea357ca7a68bf0f1e215c2fd557dc53735')

build() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
