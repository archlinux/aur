# Maintainer: BrainDamage

pkgname=python-untangle
pkgver=1.2.1
pkgrel=3
pkgdesc="Converts XML to a Python object"
arch=('any')
url="https://github.com/stchris/untangle"
license=('MIT')
depends=('python' 'python-defusedxml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('696643dd2879c1af55c592e07bf0de48d330157d2def66993abaa0169661dadc')

_basename="${pkgname#python-}"
_dirname="${_basename}-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
