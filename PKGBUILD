#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
pkgver=1.3.2
pkgrel=1
pkgdesc='An extending constructor of PyYAML: include YAML files into YAML document'
arch=('any')
url="https://github.com/tanbro/pyyaml-include"
license=('GPL3')
depends=('python-toml' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=(
  "git+https://github.com/tanbro/pyyaml-include#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd pyyaml-include
  python -m build --wheel --no-isolation
}

check() {
  cd pyyaml-include
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd pyyaml-include
  python -m installer --destdir="$pkgdir" dist/*.whl
}
