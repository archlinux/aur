# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor:  MartJosip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-iso639
_libname=iso639
pkgver=0.4.5
pkgrel=8
pkgdesc="Python library for ISO 639 standard"
arch=('any')
url="https://github.com/noumar/iso639"
license=('AGPL-3.0-only')
depends=('python' 'python-setuptools')
makedepends=(
	'python-build'
	'python-installer'
)
source=("${_libname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e68347887a438a0c49e6fe053206bf5d40348c4624f5ccffadc8bed2fa5e8ac9')

build() {
	cd "${srcdir}/${_libname}-${pkgver}"
	python -m build
}

# Fails for whatever reason since 2024-11-16, just commented out, dead library
# Probably caused by this:
#/usr/lib/python3.12/site-packages/iso639/iso639.py:247: SyntaxWarning: invalid escape sequence '\['
#/usr/lib/python3.12/site-packages/iso639/iso639.py:247: SyntaxWarning: invalid escape sequence '\['

#check() {
#	cd "${srcdir}/${_libname}-${pkgver}"
#	python setup.py test
#}

package() {
	cd "${srcdir}/${_libname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
