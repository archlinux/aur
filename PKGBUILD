#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
pkgver=2.0.1
pkgrel=1
pkgdesc='An extending constructor of PyYAML: include YAML files into YAML document'
arch=('any')
url="https://github.com/tanbro/pyyaml-include"
license=('GPL-3.0-or-later')
depends=('python-fsspec' 'python-toml' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-aiohttp' 'python-requests')
source=(
  "git+https://github.com/tanbro/pyyaml-include#tag=v$pkgver"
)
sha256sums=(
  'b4e9a8a4b7ca33067b756fe4a5339784318be6de16adb8803b182e6644622c0c'
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
