#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
_pypi=pyyaml-include
pkgver=1.3
pkgrel=1
pkgdesc='An extending constructor of PyYAML: include YAML files into YAML document'
arch=('any')
url="https://github.com/tanbro/pyyaml-include"
license=('GPL3')
depends=('python-toml' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'fix_build_system.patch'
)
sha256sums=(
  'f7fbeb8e71b50be0e6e07472f7c79dbfb1a15bade9c93a078369ff49e57e6771'
  '9eabb99630d3d18b8116e0ff0eba4f3680cdcf5bfc3a8273e824b39d67ccaa6d'
)

prepare() {
  cd "$_pypi-$pkgver"
  patch -p0 -i "$srcdir/fix_build_system.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  PYTHONPATH=build/lib pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
