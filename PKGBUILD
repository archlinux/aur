# Maintainer: arielzn <arielzn at riseup dot net>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=python-spython
_module='spython'
pkgver=0.3.14
pkgrel=2
pkgdesc="streamlined singularity python client (spython) for singularity"
arch=('any')
url='https://github.com/singularityhub/singularity-cli'
license=('MPL2')
depends=('python')
optdepends=(
	'singularity-container'
        'apptainer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pytest-runner'
)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8ad53ef034395cfa2d8a710cc1c3638e4475e5bbc6a2842d317db8013c2e4188')

build() {
        cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

#check() {
#        cd "${srcdir}/${_module}-${pkgver}"
#	python setup.py pytest
#}

package() {
        cd "${srcdir}/${_module}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
