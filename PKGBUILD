# Maintainer: BrainDammagee

pkgname=python-pelican-jupyter
pkgver=0.10.0
pkgrel=3
pkgdesc="Pelican plugin for Jupyter Notebooks"
arch=('any')
url="https://github.com/danielfrg/pelican-jupyter"
license=('apache')
depends=('python' 'pelican' 'jupyter-nbconvert' 'jupyter-nbformat')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f2ab1505a494b1bb13065574d8ab3687c9f207d5be4c6a192da7fe4255f5e385')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
