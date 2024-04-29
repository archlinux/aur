# Maintainer: BrainDamage

pkgname=python-pelican-jupyter
pkgver=0.10.1
pkgrel=2
pkgdesc="Pelican plugin for Jupyter Notebooks"
arch=('any')
url="https://github.com/danielfrg/pelican-jupyter"
license=('apache')
depends=('python' 'pelican' 'jupyter-nbconvert' 'jupyter-nbformat')
makedepends=('python-setuptools' 'python-setuptools-scm')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('775f19b674198e2c6f713ee00fb439f74398e98fa5bf2696af1eff461b06933d')

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
