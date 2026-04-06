# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-file-tree
_name=file_tree
pkgver=1.6.1
pkgrel=1
pkgdesc="Framework to represent structured directories in python as FileTree objects. It can also be used to visualise the data in structured directories using fsleyes."
arch=('any')
url="https://pypi.org/project/file-tree/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-uv-build')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('f46705e9e51f2ac2648ac4ff849207e4574d2ac53e648286242df24c45598db9')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i 's/0.9.0/0.12.0/g' pyproject.toml # "Patch" for use with uv_build > 0.9.0
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
