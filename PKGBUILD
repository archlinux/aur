# Maintainer: Alejandro Oranday <alejandro@oran.day>

pkgname='python-xer-reader'
_name=${pkgname#python-}
_pyname=${_name//-/_}
pkgver=0.4.1
pkgrel=1
pkgdesc='Read the contents of a Primavera P6 XER file using Python.'
arch=('any')
url='https://github.com/jjCode01/xer-reader'
license=('GPL-3.0-only')
depends=('python'
	     'python-openpyxl')
makedepends=('python-poetry')
provides=('python-xer-reader')
conflicts=('python-xer-reader')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('51d558ca3fc020a3c274b2648db5aaa6611831028e32b62a9c3f34909a3eb249')

build() {
	cd "${_pyname}-${pkgver}"

	# The test script provided depends on a user making changes to the package contents and providing XER files to test on.
	# The naming of the script also conflicts with the Linux command `test`. For this reason, I comment it out.
	sed "s/test /#test /" -i pyproject.toml
	python -m build --wheel --no-isolation
}


package() {
	cd "${_pyname}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl
}
